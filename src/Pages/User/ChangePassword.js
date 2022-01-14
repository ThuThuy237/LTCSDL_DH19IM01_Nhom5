import React from 'react';
import {
    Row,
    Col,
    Button,
    Form,
    Input,
} from 'antd';
import { useDispatch } from 'react-redux';
import styles from '../../Styles/InfoUser.module.scss';
import { changePw } from '../../reducers/Login/action';


export default function InfoUser() {
    // const { userLogin } = useSelector(state => state.LoginReducer);
    const dispatch = useDispatch();
    const [form] = Form.useForm();

    const onFinish = (values) => {
        let data = {
            password: values.password,
        }
        form.resetFields();
        dispatch(changePw(data));
    }
    const onFinishFailed = (errorInfo) => {
        console.log(errorInfo);
    }

    return (
        <>
            <Row >
                <Col span={24}><h1 className={styles.titlePage}><span>Change Password</span></h1></Col>
            </Row>

            <Row justify="center" style={{ marginTop: '50px' }}>
                <Col span={14}>
                    <Form
                        name="basic"
                        labelCol={{ span: 6 }}
                        labelAlign="left"
                        wrapperCol={{ span: 18 }}
                        form={form}
                        onFinish={onFinish}
                        onFinishFailed={onFinishFailed}
                    >
                        {/* <Form.Item
                            name="oldPassword"
                            label="Old Password"
                            rules={[{ required: true, message: 'Please input old password!' }]}
                        >
                            <Input.Password style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder="Old password..." />
                        </Form.Item> */}
                        <Form.Item
                            name="password"
                            label="New Password"
                            rules={[{ required: true, message: 'Please input new password!' }]}
                        >
                            <Input.Password style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder="New password..." />
                        </Form.Item>
                        <Form.Item
                        name="confirm"
                            label="Confirm Password"
                            dependencies={['password']}
                            hasFeedback
                            rules={[
                                {
                                    required: true,
                                    message: 'Please confirm your password!',
                                },
                                ({ getFieldValue }) => ({
                                    validator(_, value) {
                                        if (!value || getFieldValue('password') === value) {
                                            return Promise.resolve();
                                        }
                                        return Promise.reject(new Error('The two passwords that you entered do not match!'));
                                    },
                                }),
                            ]}
                        >
                            <Input.Password style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder="Confirm..." />
                        </Form.Item>

                        <Form.Item
                        >
                            <Button size="large" shape="round" type="primary" htmlType="submit">Submit</Button>
                        </Form.Item>
                    </Form>
                </Col>
            </Row>


        </>
    )
}
