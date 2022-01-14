import { Col } from 'antd';
import React from 'react';
import { NavLink } from 'react-router-dom';
import CreatePostForm from '../../Components/CreatePostForm';
import {BackwardOutlined} from '@ant-design/icons';

export default function CreatePost() {
    return (<>
        <h1>
            <Col offset={2}><NavLink to="/recruiter/posted-jobs" className="btn btn-info rounded">
                <BackwardOutlined style={{fontSize: '1.5rem'}}/> Back</NavLink>
                </Col>
            <Col span={24} offset={8} className="mb-5">Create new post</Col>
        </h1>
        <CreatePostForm />
    </>
    )
}
