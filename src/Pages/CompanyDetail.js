import React, { useEffect, useCallback } from 'react';
import { useParams } from "react-router-dom";
import { Row, Col, Divider, Avatar, Tabs, Rate, Pagination, Comment } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { actGetReview, getRecruiter } from '../reducers/Recruiter/action';
import Loading from '../Components/Loading';
import Error from '../Components/Error';
import myStyles from '../Styles/CompanyDetail.module.scss';
import {
    LaptopOutlined,
    EnvironmentOutlined,
    MailOutlined,
    PhoneOutlined
} from '@ant-design/icons';
import JobCard from '../Components/JobCard';

const { TabPane } = Tabs;
export default function CompanyDetail() {
    let { id } = useParams();
    const dispatch = useDispatch();
    const { err, loading, recruiter, listReview } = useSelector(state => state.RecruiterReducer);

    useEffect(() => {
        const action = getRecruiter(id);
        dispatch(action);
        dispatch(actGetReview(id));
    }, [dispatch, id])

    const renderPost = useCallback(
        () => {
            if (loading) { return <Loading /> }
            if (err) { return <Error /> }
            if (recruiter) {
                return <>
                    <Row className="container">
                        {/* Left */}
                        <Col span={6} className="mt-3">
                            <div style={{ backgroundColor: '#fff' }}>
                                <div className={myStyles.bgLogo}>
                                    <Avatar size={64}
                                        className={myStyles.logo}
                                        src={<img src={recruiter.logo_image} alt="companyLogo" onError={e => e.target.src = "https://cdn.logo.com/hotlink-ok/logo-social.png"} />} />

                                </div>
                                <h3 className="text-center m-1">{recruiter.company_name}</h3>
                                <p className="text-center m-0"><Rate disabled allowHalf defaultValue={recruiter.avg_rating} /></p>
                                <p className="text-muted text-center m-1">{recruiter.avg_rating} / 5</p>
                            </div>
                            <div className="p-1 mb-5 mt-2">

                                <Row style={{ fontSize: "1.1rem" }} align="middle">
                                    <Col offset={1} span={2}><MailOutlined /></Col>
                                    <Col offset={1} span={18}>
                                        <div className="font-weight-bold">Contact email:</div>
                                        <div >{recruiter.contact_email}</div>
                                    </Col>
                                </Row>
                                <Divider plain className="border-top border-info my-3" />
                                <Row style={{ fontSize: "1.1rem" }} align="middle">
                                    <Col offset={1} span={2}><PhoneOutlined /></Col>
                                    <Col offset={1} span={18} >
                                        <div className="font-weight-bold">Contact phone:</div>
                                        <div >{recruiter.contact_phone}</div>
                                    </Col>
                                </Row>
                                <Divider plain className="border-top border-info my-3" />
                                <Row style={{ fontSize: "1.1rem" }} align="middle">
                                    <Col offset={1} span={2}><EnvironmentOutlined /></Col>
                                    <Col offset={1} span={18} >
                                        <div className="font-weight-bold">Address:</div>
                                        <div >{recruiter.address}</div>
                                    </Col>
                                </Row>
                                <Divider plain className="border-top border-info my-3" />
                                <Row style={{ fontSize: "1.1rem" }} align="middle">
                                    <Col offset={1} span={2}><LaptopOutlined /></Col>
                                    <Col offset={1} span={18} >
                                        <div className="font-weight-bold">Posted</div>
                                        <div >{recruiter.count_post}</div>
                                    </Col>
                                </Row>
                            </div>
                        </Col>
                        {/* Right */}
                        <Col span={16} offset={2}>
                            <Tabs defaultActiveKey="1" size="large">
                                <TabPane
                                    tab={
                                        <span>
                                            <LaptopOutlined />
                                            Jobs Posted
                                        </span>
                                    }
                                    key="1"
                                >
                                    {recruiter.list_post?.map(post => {
                                return <JobCard
                                    key={post.id}
                                    id={post.id}
                                    title={post.title}
                                    location={post.location}
                                    subtitle={post.subtitle}
                                    image={post.image}
                                    created_date={post.created_date}
                                    category={post.category}
                                    salary={post.salary}
                                />
                            })}
                            <Pagination defaultCurrent={1} pageSize={5} total={recruiter.count_post} className="text-center mt-1 mb-5" />
                        
                                </TabPane>
                                <TabPane
                                    tab={
                                        <span>
                                            <LaptopOutlined />
                                            Review
                                        </span>
                                    }
                                    key="2"
                                >
                                    {listReview? listReview.map((item, index) => {
        return <Comment
        key={index}
        author={item.user.username}
        avatar={<Avatar src={item.user.avatar} alt="Han Solo" />}
        content={
            <>
            <Rate disabled defaultValue={item.stars} />
            <p>{item.comment}</p>
          </>
          
        }
        datetime="12/12/2015"
        //   <Tooltip title={moment().format('YYYY-MM-DD HH:mm:ss')}>
        //     <span>{moment().fromNow()}</span>
        //   </Tooltip>
        
      />
      })
                                    
                                    
                                    :<h3 className="text-center text-muted">No reviews</h3>}
                                </TabPane>
                            </Tabs>
                        </Col>
                    </Row>

                </>
            }
        }, [recruiter, loading, err, listReview])
    return (
        <div>
            {renderPost()}
        </div>
    )
}
