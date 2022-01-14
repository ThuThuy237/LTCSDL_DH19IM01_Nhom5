import React, { useCallback, useEffect } from 'react';
import {
    Row,
    Col,
    Table,
    Modal,
    Button,
    Space,
    Switch,
    Result
} from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import styles from '../../Styles/InfoUser.module.scss'
import { DeleteOutlined, ExclamationCircleOutlined, PlusOutlined } from "@ant-design/icons";
import { actActive, deletePost, getOwnerPost } from '../../reducers/PostJob/action';
import { getRecruiter } from '../../reducers/Recruiter/action';
import { NavLink } from 'react-router-dom';

const { confirm } = Modal;

export default function PostedJobs() {
    const dispatch = useDispatch();
    const { userLogin } = useSelector(state => state.LoginReducer);
    const { postOwner } = useSelector(state => state.PostJobReducer);
    const { recruiter } = useSelector(state => state.RecruiterReducer);

    useEffect(() => {
        dispatch(getOwnerPost());
        dispatch(getRecruiter(userLogin.id));
    }, [dispatch, userLogin]);

    const renderView = useCallback(
        () => {
            if (recruiter?.is_accepted === false) {return <Result
                status="warning"
                title="You are not allowed to accept this action."
                extra={
                  <NavLink to="/" className="btn btn-primary rounded">
                    Go home
                  </NavLink>
                }
              />}
            if (recruiter?.is_accepted === true) {
                const changeActive = (postId) => {
                    confirm({
                        title: 'Are you sure change active status this post?',
                        icon: <ExclamationCircleOutlined className="text-info" />,
                        content: 'Applicant can view and apply this post if active status is active.',
                        okText: 'Yes',
                        cancelText: 'No',
                        onOk() {
                            dispatch(actActive({ "postId": postId }));
                        },
                        onCancel() {
                            dispatch(getOwnerPost());
                        },
                    });
                }
                const columns = [
                    {
                        title: 'Title',
                        dataIndex: 'title',
                        key: 'title',
                        render: (text, record) => <NavLink className="text-dark" to={`/recruiter/managePost/${record.id}`}><strong>{text}</strong></NavLink>,
                    },
                    {
                        title: 'Create date',
                        dataIndex: 'created_date',
                        key: 'created_date',
                    },
                    {
                        title: 'Active',
                        dataIndex: 'active',
                        key: 'active',
                        render: (text, record) => (<>
                            <Switch defaultChecked={text} onClick={() => { changeActive(record.id) }} />
                        </>)
                    },
                    {
                        title: 'Action',
                        key: 'action',
                        render: (text, record) => (
                            <Space size="middle">
                                <Button
                                    shape="circle"
                                    type="link"
                                    icon={<DeleteOutlined className="text-danger" style={{ fontSize: "1.7rem" }} />}
                                    onClick={() => {
                                        confirm({
                                            title: 'Are you sure delete this task?',
                                            icon: <ExclamationCircleOutlined />,
                                            content: 'This post will be deleted, you cannot undo this action',
                                            okText: 'Yes',
                                            okType: 'danger',
                                            cancelText: 'No',
                                            onOk() {
                                                dispatch(deletePost(record.id));
                                            },
                                            onCancel() {
                                                dispatch(getOwnerPost());
                                            },
                                        });
                                    }} />
                            </Space>
                        ),
                    },

                ];
                return <>
                    <Row justify="space-between">
                        <Col span={12}>
                            <h1 className={styles.titlePage}><span>Jobs Posted</span></h1>
                        </Col>
                        <Col span={6}>
                            <NavLink to="/recruiter/create" className="btn btn-success">
                            <PlusOutlined style={{ fontSize: "1.5rem" }} /> Create New Post
                            </NavLink>
                        </Col>
                    </Row>
                    <Row justify="center" style={{ marginTop: '50px' }}>
                        <Col span={20}>
                            <Table columns={columns} dataSource={postOwner} />
                        </Col>
                    </Row>

                </>
            }
        }, [dispatch, postOwner, recruiter])
    return (
        <>
            {renderView()}
        </>
    )
}
