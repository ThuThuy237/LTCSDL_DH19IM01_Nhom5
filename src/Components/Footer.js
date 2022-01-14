import React from 'react';
import myStyles from '../Styles/Footer.module.scss';
import { Row, Col, Input, Button } from 'antd';
import {
    FacebookOutlined,
    InstagramOutlined,
    TwitterOutlined,
    GithubOutlined,
  } from '@ant-design/icons';

export default function Footer() {
    return (
        <div className={myStyles.footer}>
            <Row justify="center" >
                <Col span={3}>
                    <h2>Explore T&T</h2>
                    <p>Sign up</p>
                    <p>Login</p>
                    <p>About my app</p>
                    <p>Become a recruiter</p>
                </Col>
                <Col span={3} offset={2}>
                    <h2>Let Us Help</h2>
                    <p>Help And Support</p>
                    <p>Impact</p>
                    <p>Terms</p>
                    <p>Privacy</p>
                </Col>
                <Col span={6} offset={2}>
                    <h2>Get Newsletter</h2>
                    <p>You can trust us. we only send promo offers, not a single.</p>
                    <Row>
                        <Col span={16}><Input style={{ borderRadius: '40px' }} size="large" placeholder="Your email here" /></Col>
                        <Col offset={2} span={6}><Button style={{backgroundColor: '#fa8914', color: '#fff'}} shape="round" size='large'>Send</Button></Col>
                    </Row>
                </Col>
            </Row>
            <Row justify="center" style={{paddingTop:'25px'}}>
                <Col span={3}>&copy; 2021 Created by TT and BT</Col>
                <Col span={3} offset={2}></Col>
                <Col span={6} offset={2}>
                <FacebookOutlined className={myStyles.icon} />
                <InstagramOutlined className={myStyles.icon}/>
                <TwitterOutlined className={myStyles.icon}/>
                <GithubOutlined className={myStyles.icon}/>
                </Col>
            </Row>
        </div>
    )
}
