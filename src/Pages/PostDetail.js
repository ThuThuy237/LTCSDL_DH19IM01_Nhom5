import React, { useEffect, useCallback, useState } from 'react';
import { useParams, useHistory } from "react-router-dom";
import { Row, Col, Divider, Tag, Button } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { gePostDetail } from '../reducers/PostJob/action';
import Loading from '../Components/Loading';
import Error from '../Components/Error';
import myStyles from '../Styles/PostDetail.module.scss';
import { actApply } from '../reducers/Apply/action';
import { NavLink } from 'react-router-dom';
import {
    PieChartOutlined,
    LaptopOutlined,
    EnvironmentOutlined,
    DollarCircleOutlined,
    ClockCircleOutlined,
    MailOutlined,
    PhoneOutlined
} from '@ant-design/icons';

export default function PostDetail() {
    let { id } = useParams();
    const history = useHistory();
    const dispatch = useDispatch();
    const { err, loading, postDetail } = useSelector(state => state.PostJobReducer);
    const { userLogin } = useSelector(state => state.LoginReducer);
    const [isApply, setIsApply] = useState(false);

    useEffect(() => {
        const action = gePostDetail(id);
        dispatch(action);
        if(userLogin?.type === "recruiter"){setIsApply(true)}
        if(userLogin?.jobApplicant?.listApply) { 
            userLogin?.jobApplicant?.listApply.forEach(ap => {
                if(ap.post.toString() === id.toString()){setIsApply(true);}
            })
        }
    }, [dispatch, id, userLogin])

    const renderPost = useCallback(
        () => {
            if (loading) { return <Loading /> }
            if (err) { return <Error /> }
            if (postDetail) {
                const apply = ()=>{
                    if(!userLogin){history.push("/login");}
                    else{
                        dispatch(actApply(id));
                    }
                }
                return <>
                    <Row className="container">
                        <Row className="border rounded p-3" style={{ backgroundColor: '#fbf4f0' }} align="middle" >
                            <Col span={4}>
                                <img src={postDetail.image} className="img-fluid" alt="imagePostJob" onError={e => e.target.src = "https://cdn.logo.com/hotlink-ok/logo-social.png"} />
                            </Col>
                            <Col span={18} offset={2}>
                                <h2 className="text-center">{postDetail.title}</h2>
                                <Row gutter={[24]} justify="space-around" >
                                    <Col span={10}>
                                        <Row>
                                            <Col span={1}>
                                                <LaptopOutlined className="mr-2 text-muted" />
                                            </Col>
                                            <Col span={20} offset={1}><div style={{ fontSize: "1.1rem" }} className="font-weight-bold">Company</div>
                                            <NavLink to={`/company/${postDetail.employer.user.id}`}>{postDetail.employer.company_name}</NavLink >
                                            </Col>
                                        </Row>
                                        <Divider className="my-2" plain />
                                    </Col>
                                    <Col span={10}>
                                        <Row>
                                            <Col span={1}>
                                                <PieChartOutlined className="mr-2 text-muted" />
                                            </Col>
                                            <Col span={20} offset={1}><div style={{ fontSize: "1.1rem" }} className="font-weight-bold">Category</div>
                                                {postDetail.category}
                                            </Col>
                                        </Row>
                                        <Divider className="my-2" plain />
                                    </Col>
                                    <Col span={10}>
                                        <Row>
                                            <Col span={1}>
                                                <EnvironmentOutlined className="mr-2 text-muted" />
                                            </Col>
                                            <Col span={20} offset={1}><div style={{ fontSize: "1.1rem" }} className="font-weight-bold">Location</div>
                                                {postDetail.location}
                                            </Col>
                                        </Row>
                                        <Divider className="my-2" plain />
                                    </Col>
                                    <Col span={10}>
                                        <Row>
                                            <Col span={1}>
                                                <EnvironmentOutlined className="mr-2 text-muted" />
                                            </Col>
                                            <Col span={20} offset={1}><div style={{ fontSize: "1.1rem" }} className="font-weight-bold">Address</div>
                                                {postDetail.address ? postDetail.address : "Private"}
                                            </Col>
                                        </Row>
                                        <Divider className="my-2" plain />
                                    </Col>
                                    <Col span={10}>
                                        <Row>
                                            <Col span={1}>
                                                <ClockCircleOutlined className="mr-2 text-muted" />
                                            </Col>
                                            <Col span={20} offset={1}><div style={{ fontSize: "1.1rem" }} className="font-weight-bold">Date update</div>
                                                {postDetail.updated_date}
                                            </Col>
                                        </Row>
                                        <Divider className="my-2" plain />
                                    </Col>

                                    <Col span={10}>
                                        <Row>
                                            <Col span={1}>
                                                <DollarCircleOutlined className="mr-2 text-muted" />
                                            </Col>
                                            <Col span={20} offset={1}><div style={{ fontSize: "1.1rem" }} className="font-weight-bold">Salary</div>
                                                {postDetail.salary ? "$ " + postDetail.salary : "Negotiation"}
                                            </Col>
                                        </Row>
                                        <Divider className="my-2" plain />
                                    </Col>
                                </Row>
                                <div className="text-center">
                                    {postDetail.tags?.map((tag, i) => {
                                        const color = ["green", "blue", "magenta", "red", "volcano", "purple", "cyan"]
                                        return <>
                                            <Tag key={i} color={color[i]}># {tag}</Tag>
                                        </>
                                    })}
                                </div>
                            </Col>
                        </Row>
                        <Col span={16}>
                            <div id={myStyles.description} dangerouslySetInnerHTML={{ __html: postDetail.description }} />
                        </Col>
                        <Col span={7} offset={1}>
                        {isApply===true?<Button className={myStyles.applyBtn} disabled={true}>Applied</Button>:<Button className={myStyles.applyBtn} onClick={apply}>Apply</Button>}
                            <div className="border border-info rounded p-1 mt-4">
                                <img src={postDetail.employer.logo_image} alt="companyLogo" onError={e => e.target.src = "https://cdn.logo.com/hotlink-ok/logo-social.png"} />
                                <h3 className="text-center">{postDetail.employer.company_name}</h3>
                            </div>
                            <div className="border border-info rounded p-1 mt-4" style={{ backgroundColor: '#eaf9fb' }}>
                                <Row style={{ fontSize: "1.1rem" }} align="middle">
                                    <Col offset={1} span={2}><MailOutlined /></Col>
                                    <Col offset={1} span={18}>
                                        <div className="text-uppercase text-muted">Contact email:</div>
                                        <div >{postDetail.employer.contact_email}</div>
                                    </Col>
                                </Row>
                                <Divider plain className="border-top border-info my-3" />
                                <Row style={{ fontSize: "1.1rem" }} align="middle">
                                    <Col offset={1} span={2}><PhoneOutlined /></Col>
                                    <Col offset={1} span={18} >
                                        <div className="text-uppercase text-muted">Contact phone:</div>
                                        <div >{postDetail.employer.contact_phone}</div>
                                    </Col>
                                </Row>
                            </div>
                        </Col>
                    </Row>

                </>
            }
        }, [postDetail, loading, err, id, history, userLogin, isApply, dispatch])
    return (
        <div>
            {renderPost()}
        </div>
    )
}
