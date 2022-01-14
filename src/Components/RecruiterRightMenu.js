import React from 'react';
import { Menu,  } from 'antd';
import { useHistory, useLocation } from 'react-router';
import {useDispatch} from 'react-redux';
import {actLogout} from '../reducers/Login/action';
import {
    PieChartOutlined,
    DesktopOutlined,
    ContainerOutlined,
} from '@ant-design/icons';

export default function RecruiterRightMenu() {
    const dispatch = useDispatch();
    const history = useHistory();
    const location = useLocation();
    
    const menuClick = (e) => {
        switch (e.key){
            case "/":
                history.push("/");
                break;
            case "/recruiter/info":
                history.push("/recruiter/info")
                break;
            case "/recruiter/company-info":
                history.push("/recruiter/company-info");
                break;
            case "/recruiter/posted-jobs":
                history.push("/recruiter/posted-jobs");
                break;
            case "/recruiter/change-password":
                history.push("/recruiter/change-password");
                break;
            case "7":
                dispatch(actLogout());
                history.push("/");
                break;
            default:
                break;
        }
    }

    return (
        <div >
            <Menu
                onClick={menuClick}
                defaultSelectedKeys={[`${location.pathname}`]}
                defaultOpenKeys={['sub1']}

            >
                <Menu.Item key="/" icon={<PieChartOutlined />}>
                    Go Home
                </Menu.Item>
                <Menu.Item key="/recruiter/info" icon={<DesktopOutlined />}>
                    Account Infomation
                </Menu.Item>
                <Menu.Item key="/recruiter/change-password" icon={<ContainerOutlined />}>
                    Change Password
                </Menu.Item>
                <Menu.Item key="/recruiter/company-info" icon={<PieChartOutlined />}>
                    Company Infomation
                </Menu.Item>
                <Menu.Item key="/recruiter/posted-jobs" icon={<DesktopOutlined />}>
                    Posted Jobs
                </Menu.Item>
                <Menu.Item key="7" icon={<ContainerOutlined />}>
                    Log Out
                </Menu.Item>
            </Menu>
        </div>
    );
}