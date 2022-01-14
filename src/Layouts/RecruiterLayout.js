import React, { useState } from 'react';
import RecruiterRightMenu from '../Components/RecruiterRightMenu';
import { Layout } from 'antd';
import tt from '../Assets/Images/tt.png';
import { useSelector } from 'react-redux';
import Forbidden from '../Components/Forbidden';

const { Header, Sider, Content, Footer } = Layout;

export default function UserLayout({ children }) {
    const [collapsed, setCollapsed] = useState(false);
    const { userLogin } = useSelector(state => state.LoginReducer);

    const toggleCollapsed = () => {
        setCollapsed(!collapsed);
    };
    return (
        <>
            {userLogin.type === "recruiter" ?
                <Layout>
                    <Sider collapsible collapsed={collapsed} onCollapse={toggleCollapsed} style={{ backgroundColor: '#fff', height: '100vh', }}>
                        <div style={{ width: '30%', margin: 'auto' }}>

                            <img alt="logo" src={tt} />

                        </div>
                        <RecruiterRightMenu />
                    </Sider>
                    <Layout className="site-layout">
                        <Header style={{ textAlign: 'right', padding: 0, backgroundColor: '#fff', paddingRight: "30px", fontSize: '16px' }}>
                            Hello <strong>{userLogin ? userLogin.username : 'Admin'}</strong>, Welcome to the management page!
                        </Header>
                        <Content
                            style={{
                                margin: '24px 16px',
                                padding: 24,
                                minHeight: 280,
                                backgroundColor: '#fff'
                            }}
                        >
                            {children}
                        </Content>
                        <Footer style={{ textAlign: 'center' }}>T&T Design ©2021 Created by TT and BT</Footer>
                    </Layout>
                </Layout>
                : <Forbidden/>}

        </>
    )
}
