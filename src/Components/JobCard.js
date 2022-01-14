import React from 'react';
import { Button, Card, Row, Col, Tag } from 'antd';
import myStyles from '../Styles/Home.module.scss';
import { ClockCircleOutlined, DollarOutlined, EnvironmentOutlined } from '@ant-design/icons';
import { Link } from 'react-router-dom';




export default function JobCard(props) {
    return (
        <Link to={`/post/${props.id}`}>
            <Card hoverable='true' className={myStyles.cardItem} style={{ marginBottom: '25px' }}>
                <Row style={{ alignItems: 'center' }} justify="center">
                    <Col span={4}>
                        <img className="img-fluid" alt="logo" src={props.image} />
                    </Col>
                    <Col span={13} offset={2}>
                        <h5 className="font-weight-bold">{props.title}</h5>
                        <p className="text-muted" ><DollarOutlined style={{ fontSize: '15px', marginRight: '10px' }} />{props.salary?"$" + props.salary: "Negotiable"}</p>
                        <p className="text-muted"><EnvironmentOutlined style={{ fontSize: '15px', marginRight: '10px' }} />{props.location}</p>
                        <p className="text-muted"><ClockCircleOutlined style={{ fontSize: '15px', marginRight: '10px' }} />{props.created_date}</p>
                        <Tag color="green"># {props.category}</Tag>
                    </Col>
                    <Col span={3} offset={2}>
                        <Button className="rounded" style={{ backgroundColor: '#38b6ff', color: '#fff', marginBottom: '10px' }} size='large'>Detail</Button>
                        <Button className="rounded" style={{ backgroundColor: '#fa8914', color: '#fff' }} size='large'>Apply</Button>
                    </Col>
                </Row>
            </Card>
        </Link>
    )
}
