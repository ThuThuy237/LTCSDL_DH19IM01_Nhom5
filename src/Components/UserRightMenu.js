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

export default function UserRightMenu() {
    const dispatch = useDispatch();
    const history = useHistory();
    const location = useLocation();
    
    const menuClick = (e) => {
        switch (e.key){
            case "/":
                history.push("/");
                break;
            case "/user/info":
                history.push("/user/info")
                break;
            case "/user/job-applications":
                history.push("/user/job-applications");
                break;
            case "/user/applied":
                history.push("/user/applied");
                break;
            case "/user/change-password":
                history.push("/user/change-password");
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
            >
                <Menu.Item key="/" icon={<PieChartOutlined />}>
                    Go Home
                </Menu.Item>
                <Menu.Item key="/user/info" icon={<DesktopOutlined />}>
                    Account Infomation
                </Menu.Item>
                <Menu.Item key="/user/change-password" icon={<ContainerOutlined />}>
                    Change Password
                </Menu.Item>
                <Menu.Item key="/user/job-applications" icon={<PieChartOutlined />}>
                    Job Applications
                </Menu.Item>
                <Menu.Item key="/user/applied" icon={<DesktopOutlined />}>
                    Applied Job
                </Menu.Item>
                <Menu.Item key="7" icon={<ContainerOutlined />}>
                    Log Out
                </Menu.Item>
            </Menu>
        </div>
    );
}