import React, { useCallback, useEffect } from 'react';
import {
    Row,
    Col,
    Table,
    Rate, Modal, Form, Input, Button,
} from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import styles from '../../Styles/InfoUser.module.scss'
import { useState } from 'react';
import { CheckCircleOutlined, CloseCircleOutlined, ClockCircleOutlined, StarOutlined } from "@ant-design/icons";
import { actRating } from '../../reducers/Apply/action';
import { actGetListApply } from '../../reducers/JobApplicant/action';


export default function Applied() {
    const dispatch = useDispatch();
    const { listApply } = useSelector(state => state.JobApplicantReducer);
    const [isModalVisible, setIsModalVisible] = useState(false);
    const [form] = Form.useForm();
    const showModal = () => {
        setIsModalVisible(true);
    };

    const handleCancel = () => {
        setIsModalVisible(false);
    };
    
    useEffect(() => {
        dispatch(actGetListApply());
    }, [dispatch])

    const renderView = useCallback(
        () => {
            if (listApply) {
                const columns = [
                    {
                        title: 'Post Title',
                        dataIndex: 'post_title',
                        key: 'title',
                        render: text => <strong>{text}</strong>,
                    },
                    {
                        title: 'Rating',
                        key: 'rate',
                        dataIndex: 'stars',
                        render: (stars, record) => (
                            <>
                                {record.status === "A" ? <>
                                    {stars ? <Button onClick={showModal} className="border-0"> <Rate disabled defaultValue={stars} /> </Button> : <StarOutlined className="text-warning" onClick={showModal} />}
                                    <Modal title="Rating" visible={isModalVisible}
                                        onOk={() => {
                                            form
                                                .validateFields()
                                                .then(values => {
                                                    form.resetFields();
                                                    setIsModalVisible(false);
                                                    values = {
                                                        post: record.post,
                                                        stars: values.stars,
                                                        comment: values.comment
                                                    }
                                                    console.log(values);
                                                    dispatch(actRating(values));
                                                })
                                                .catch(info => {
                                                    console.log('Validate Failed:', info);
                                                });
                                        }} onCancel={handleCancel}>
                                        <Form
                                            name="basic"
                                            labelCol={{ span: 8 }}
                                            wrapperCol={{ span: 16 }}
                                            form={form}
                                            autoComplete="off"
                                            initialValues={{
                                                stars: record.stars,
                                                comment: record.comment,
                                            }}
                                        >
                                            <Form.Item name="stars" label="Rate">
                                                <Rate />
                                            </Form.Item>
            
                                            <Form.Item
                                                label="Comment"
                                                name="comment"
                                            >
                                                <Input.TextArea />
                                            </Form.Item>
                                        </Form>
                                    </Modal>
                                </> : ""}
                            </>
                        ),
                    },
                    {
                        title: 'Apply date',
                        dataIndex: 'date_apply',
                        key: 'date',
                    },
                    {
                        title: 'Status',
                        dataIndex: 'status',
                        key: 'status',
                        filters: [
                            { text: 'Pass', value: 'A' },
                            { text: 'Refuse', value: 'R' },
                            { text: 'Pending', value: 'P' },
                        ],
                        onFilter: (value, record) => record.status.includes(value),
                        render: text => (<>
                            {text === "A" ? <><CheckCircleOutlined className="text-success" style={{ fontSize: "1.7rem" }} /> Pass</> : ""}
                            {text === "R" ? <><CloseCircleOutlined className="text-danger" style={{ fontSize: "1.7rem" }} /> Refuse</> : ""}
                            {text === "P" ? <><ClockCircleOutlined className="text-warning" style={{ fontSize: "1.7rem" }} /> Pending</> : ""}
                        </>)
                    },
            
                ];
                return <>
                    <Row >
                        <Col span={24}><h1 className={styles.titlePage}><span>Applied Jobs</span></h1></Col>
                    </Row>

                    <Row justify="center" style={{ marginTop: '50px' }}>
                        <Col span={20}>
                            <Table columns={columns} dataSource={listApply} />
                        </Col>
                    </Row>

                </>
            }
        }, [listApply, dispatch, form, isModalVisible])
    return (
        <>
            {renderView()}
        </>
    )
}
