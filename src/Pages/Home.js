import React, { useEffect, useCallback, useState } from 'react';
import myStyles from '../Styles/Home.module.scss';
import { Link } from 'react-router-dom';
import { ArrowRightOutlined } from '@ant-design/icons';
import { FcStatistics, FcPrevious, FcNext, FcBullish } from 'react-icons/fc';
import { Form, Input, Select, Button, Card, Row, Col, Tabs  } from 'antd';
import Loading from '../Components/Loading';
import { useDispatch, useSelector } from 'react-redux';
import { getTopPost, getListPost } from '../reducers/PostJob/action';
import { getListCategory, getListLocation } from '../reducers/GetResource/action';
import JobCard from '../Components/JobCard';
import Error from '../Components/Error';

const { Option } = Select;
const { TabPane } = Tabs;
const gridStyle = {
    width: '25%',
    textAlign: 'center',
    margin: '25px 40px',
    fontSize: '20px',
    display: 'flex',
    flexDirection: 'column',
};

export default function Home() {
    const dispatch = useDispatch();
    const { err, loading, listPost, topPost } = useSelector(state => state.PostJobReducer);
    const { listCategory, listLocation } = useSelector(state => state.GetResourceReducer);
    const [activeKey, setActiveKey] = useState('1')

    useEffect(() => {
        const action = getTopPost();
        dispatch(action);
        dispatch(getListCategory());
        dispatch(getListLocation());
    }, [dispatch])

    const renderListPost = useCallback(
        () => {
            if (loading) { return <Loading /> }
            if (err) { return <Error /> }
            if (listPost && listPost.results) {
                return <>
                    {listPost.results?.map(post => {
                        return <JobCard
                            key={post.id}
                            id={post.id}
                            title={post.title}
                            location={post.location}
                            subtitle={post.subtitle}
                            image={post.image}
                            created_date={post.created_date}
                            salary={post.salary}
                            category={post.category}
                        />
                    })}
                </>
            }
        },
        [listPost, loading, err,]
    );
    const renderTopPost = useCallback(
        () => {
            if (loading) { return <Loading /> }
            if (err) { return <Error /> }
            if (topPost && !topPost.results) {
                return <>
                    {topPost?.map(post => {
                        return <JobCard
                            key={post.id}
                            id={post.id}
                            title={post.title}
                            location={post.location}
                            subtitle={post.subtitle}
                            image={post.image}
                            created_date={post.created_date}
                            salary={post.salary}
                            category={post.category}
                        />
                    })}
                </>
            }
        },
        [topPost, loading, err,]
    );

    const onFinish = (values) => {
        let data = {
            ...values,
        }
        setActiveKey('2')
        const action = getListPost(data);
        // const action = getListPost(cate, loca, kwarg);
        dispatch(action);
    };
    const onChange = (key)=> {
        setActiveKey(key);
    }
    return (
        <>
            <div className={myStyles.banner}>
                <div className={myStyles.content}>
                    <h1 className={myStyles.headers}>FIND YOUR DREAM <span style={{ color: '#fa8914' }}>JOB</span> WITH COMPORT</h1>
                    <p className={myStyles.subContent}>Wherein herb beginning. Moved after gathering. Sea hi crate fowl man replenish place divided likeness herb one two lnetn Winged moving saw, may over.</p>
                    <Link to='/' style={{ fontWeight: "bold" }}>EXPLORE NOW <ArrowRightOutlined /></Link>
                </div>
            </div>
            <div className={myStyles.itemContainer}>
                <div className={myStyles.search}>
                    <Form
                        name="search"
                        layout="inline"
                        onFinish={onFinish}
                        style={{ justifyContent: 'center' }}
                    >
                        <Form.Item
                            name="category"
                        >
                            <Select placeholder="Select category" size="large" style={{ width: `250px` }}>
                                {listCategory?.results?.map(category =>{
                                    return <Option key={category.id} value={category.id}>{category.name}</Option>
                                })}
                            </Select>
                        </Form.Item>

                        <Form.Item
                            name="location"
                        >
                            <Select placeholder="Select location" size="large" style={{ width: `250px` }}>
                            {listLocation?.results?.map(location =>{
                                    return <Option key={location.id} value={location.id}>{location.city}, {location.country}</Option>
                                })}
                            </Select>
                        </Form.Item>

                        <Form.Item name="kw">
                            <Input placeholder='Key word' size="large" style={{ width: `250px` }} />
                        </Form.Item>

                        <Form.Item>
                            <Button type="primary" htmlType="submit" style={{ borderRadius: '10px' }} size="large">
                                Submit
                            </Button>
                        </Form.Item>
                    </Form>
                </div>
                <div className={myStyles.itemContainer}>
                <h1 className={myStyles.headers}>{activeKey === '1'? 'Browse recent jobs': 'Search result'}</h1>
                <Tabs activeKey={activeKey} centered onChange={onChange}>
                    <TabPane tab="Recent Job" key="1">
                    {renderTopPost()}
                    </TabPane>
                    <TabPane tab="Rearch result" key="2">
                    {renderListPost()}
                    </TabPane>
                </Tabs>
                
                <Link to='/find-job' className={myStyles.btnNext} >Show More....</Link>
            </div>
            </div>
            
            <div className={myStyles.darkItemContainer}>
                <h1 className={myStyles.headers}>Get job information daily</h1>
                <p className={myStyles.headers}>Subscribe to our newsletter and get a coupon code!</p>
                <Row justify="center">
                    <Col span={8}><Input style={{ borderRadius: '40px' }} size="large" placeholder="Your email here" /></Col>
                    <Col offset={1} span={2}><Button style={{ backgroundColor: '#fa8914', color: '#fff' }} shape="round" size='large'>Send</Button></Col>
                </Row>
            </div>
            <div className={myStyles.itemContainer}>
                <h1 className={myStyles.headers}>Top Concern</h1>
                <Card bordered="false" className={myStyles.cardContainer}>
                    <Card.Grid style={gridStyle}><span style={{ fontSize: '40px' }}><FcStatistics /></span>Markettings</Card.Grid>
                    <Card.Grid style={gridStyle}><span style={{ fontSize: '40px' }}><FcPrevious /><FcNext /></span>Infomation Teachnology</Card.Grid>
                    <Card.Grid style={gridStyle}><span style={{ fontSize: '40px' }}><FcBullish /></span>Data Analytics</Card.Grid>
                </Card>
            </div>
        </>
    )
}
