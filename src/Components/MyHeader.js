import React from 'react';
import { Row, Col } from 'antd';
import { NavLink } from 'react-router-dom';
import myStyles from '../Styles/HeaderStyle.module.scss';
import RightNavBar from './RightNavBar';
import Logo from './Logo';

export default function MyHeader() {

    return (
        <Row id={myStyles.myHeader}>
            <Col className={myStyles.imageContainer} span={4}>
                <div className={myStyles.logo}>
                    <Logo />
                </div>
            </Col>
            <Col className={myStyles.navItemContainer} span={12}>
                <NavLink exact activeClassName={myStyles.active} to="/">Home</NavLink >
                <NavLink activeClassName={myStyles.active} to="/find-job">Find Jobs</NavLink >
                <NavLink activeClassName={myStyles.active} to="/company-review">Company Review</NavLink >
                <NavLink activeClassName={myStyles.active} to="/about">About Us</NavLink >
                <NavLink activeClassName={myStyles.active} to="/contact">Contact</NavLink >
            </Col>
            <Col className={myStyles.navItemContainer} span={6}>
                <RightNavBar />
            </Col>
        </Row>
    )
}
