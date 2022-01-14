import React, {useState, useEffect} from 'react';
import myStyles from '../Styles/PostDetail.module.scss';
import {
    PieChartOutlined,
    LaptopOutlined,
    EnvironmentOutlined,
    DollarCircleOutlined,
    ClockCircleOutlined,
    MailOutlined,
    PhoneOutlined
} from '@ant-design/icons';
import { Row, Col, Divider, Tag, Button } from 'antd';
import { useSelector } from 'react-redux';


export default function ReviewPost(props) {
    const { recruiter } = useSelector(state => state.RecruiterReducer);
    const current = new Date();
    const date = `${current.getDate()}/${current.getMonth()+1}/${current.getFullYear()}`;
    const [preview, setPreview] = useState()

    useEffect(() => {
        if (!props.image) {
            setPreview(undefined)
            return
        }else if(typeof props.image === 'string' || props.image instanceof String){
            setPreview(props.image);
        }
        else{
            setPreview(URL.createObjectURL(props.image.file.originFileObj));
        }
    }, [props])

    const renderView = React.useCallback(() => {
        if(recruiter){return <Row className="container">
        <Row className="border rounded p-3" style={{ backgroundColor: '#fbf4f0' }} align="middle" >
            <Col span={4}>
                <img src={preview} className="img-fluid" alt="imagePostJob" onError={e => e.target.src = "https://cdn.logo.com/hotlink-ok/logo-social.png"} />
            </Col>
            <Col span={18} offset={2}>
                <h2 className="text-center">{props.title}</h2>
                <Row gutter={[24]} justify="space-around" >
                    <Col span={10}>
                        <Row>
                            <Col span={1}>
                                <LaptopOutlined className="mr-2 text-muted" />
                            </Col>
                            <Col span={20} offset={1}><div style={{ fontSize: "1.1rem" }} className="font-weight-bold">Company</div>
                            {recruiter.company_name}
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
                                {props.category}
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
                                {props.location}
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
                                {props.address ? props.address : "Private"}
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
                                {date}
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
                                {props.salary!=="0" ? "$ " + props.salary : "Negotiation"}
                            </Col>
                        </Row>
                        <Divider className="my-2" plain />
                    </Col>
                </Row>
                <div className="text-center">
                    {props.tags?.map((tag, i) => {
                        const color = ["green", "blue", "magenta", "red", "volcano", "purple", "cyan"]
                        return <>
                            <Tag key={i} color={color[i]}># {tag}</Tag>
                        </>
                    })}
                </div>
            </Col>
        </Row>
        <Col span={16}>
            <div id={myStyles.description} dangerouslySetInnerHTML={{ __html: props.description }} />
        </Col>
        <Col span={7} offset={1}>
        <Button className={myStyles.applyBtn} disabled={true}>Applied</Button>
            <div className="border border-info rounded p-1 mt-4">
                <img src={recruiter.logo_image} alt="companyLogo" onError={e => e.target.src = "https://cdn.logo.com/hotlink-ok/logo-social.png"} />
                <h3 className="text-center">{recruiter.company_name}</h3>
            </div>
            <div className="border border-info rounded p-1 mt-4" style={{ backgroundColor: '#eaf9fb' }}>
                <Row style={{ fontSize: "1.1rem" }} align="middle">
                    <Col offset={1} span={2}><MailOutlined /></Col>
                    <Col offset={1} span={18}>
                        <div className="text-uppercase text-muted">Contact email:</div>
                        <div >{recruiter.contact_email}</div>
                    </Col>
                </Row>
                <Divider plain className="border-top border-info my-3" />
                <Row style={{ fontSize: "1.1rem" }} align="middle">
                    <Col offset={1} span={2}><PhoneOutlined /></Col>
                    <Col offset={1} span={18} >
                        <div className="text-uppercase text-muted">Contact phone:</div>
                        <div >{recruiter.contact_phone}</div>
                    </Col>
                </Row>
            </div>
        </Col>
    </Row>}
    }, [recruiter, date, props, preview])
    return (
        <>
        {renderView()}
        </>
    )
}
