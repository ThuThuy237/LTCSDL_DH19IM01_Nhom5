import React ,{useEffect} from 'react';
import { useParams } from "react-router-dom";
import { Col, Row, Tabs } from 'antd';
import { NavLink } from 'react-router-dom';
import { BackwardOutlined } from '@ant-design/icons';
import myStyles from '../../Styles/ManagePost.module.scss';
import TableApplicans from '../../Components/TableApplicans';
import {geListApplications, gePostDetail, } from '../../reducers/PostJob/action';
import { useDispatch, useSelector } from 'react-redux';
import UpdatePostForm from '../../Components/UpdatePostForm';

export default function ManagePost() {
    const dispatch = useDispatch();
    let { id } = useParams();
    const { TabPane } = Tabs;
    const { listApplicants, postDetail} = useSelector(state => state.PostJobReducer);
    useEffect(() => {
        dispatch(geListApplications({'postId': id}));
        dispatch(gePostDetail(id));
    }, [dispatch, id]);
    return (
        <div>
            <Row className="text-center">
                <Col span={4}><NavLink to="/recruiter/posted-jobs" className="btn btn-info rounded">
                    <BackwardOutlined style={{ fontSize: '1.5rem' }} /> Back</NavLink>
                </Col>
                <Col span={16}>
                    <h1 id={myStyles.headTitle}>Manage Post</h1>
                </Col>
                <Col span={4}>

                </Col>

            </Row>
            <Row className="mt-4 container">
                <Tabs tabPosition="left" size="large" tabBarGutter={25} className="container">
                    <TabPane tab="List Of Applicants" key="1">
                        <TableApplicans data={listApplicants}/>
                    </TabPane>
                    <TabPane tab="Edit Post" key="2">
                        <UpdatePostForm obj={postDetail} id={id}/>
                    </TabPane>
                </Tabs>
            </Row>

        </div>
    )
}
