import React, { useState } from 'react'
import myStyles from '../Styles/RegisterRecruiter.module.scss';
import { Form, Input, Button, Divider, notification, Result } from 'antd';
import { actionRegisterRecruiter } from '../reducers/RegisterRecruiter/action';
import { NavLink } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { useHistory } from "react-router-dom";
import 'react-phone-number-input/style.css';
import PhoneInput from 'react-phone-number-input';

export default function Register() {
    const dispatch = useDispatch();
    let history = useHistory();
    const { err, userLogin } = useSelector(state => state.LoginReducer);
    const [phone, setPhone] = useState('');
    const [success, setSuccess] = useState(false);

    const openNotification = (mess, description) => {
        notification.open({
            message: mess,
            description:
                description,
            placement: 'bottomRight',
            type: 'error',
            style: {
                width: 400,
            },
        });
    };

    const onFinishFailed = (errorInfo) => {
        console.log('Failed:', errorInfo);
        setSuccess(false);
    };

    const renderPage = React.useCallback(
        () => {
            const onFinish = (values) => {
                const data = {
                    ...values,
                    user: userLogin.id
                }
                setSuccess(true);
                dispatch(actionRegisterRecruiter(data));
            };
            /* eslint-disable no-template-curly-in-string */
            const validateMessages = {
                required: '${label} is required!',
                types: {
                    email: '${label} is not a valid email!',
                },
            };
            /* eslint-enable no-template-curly-in-string */
            return <>
                {err === null ? '' : openNotification('Login failed', err)}
                {userLogin === null ? history.push('/login') : ''}
                {success ? <Result
                    status="success"
                    title="Great! We will noti to you after the administrator accepts, please wait."
                    extra={[
                        <Button type="primary" key="console">
                            <NavLink to="/">Go home</NavLink>
                        </Button>,
                    ]}
                /> : <div className={myStyles.register}>
                    <div className={myStyles.registerContainer}>
                        <h1 >
                            YOUR COMPANY INFORMATION
                        </h1>

                        <Form
                            name="basic"
                            initialValues={{ remember: true }}
                            onFinish={onFinish}
                            onFinishFailed={onFinishFailed}
                            validateMessages={validateMessages}
                        >
                            <Form.Item
                                label="Company Name "
                                labelCol={{ span: '24' }}
                                name="company_name"
                                rules={[{ required: true, }]}
                            >
                                <Input style={{ height: `50px` }} size="large" placeholder="e.g: TTDemy" />
                            </Form.Item>

                            <Form.Item
                                label="Company Email "
                                labelCol={{ span: '24' }}
                                name="contact_email"
                                rules={[{ required: true, type: 'email' }]}
                            >
                                <Input style={{ height: `50px` }} size="large" placeholder="e.g: vietnam@ttdemy.com" />
                            </Form.Item>

                            <Form.Item
                                name="contact_phone"
                                label="Company Phone "
                                labelCol={{ span: '24' }}
                                rules={[{ required: true, }]}
                            >
                                <PhoneInput
                                    className={myStyles.phoneInput}
                                    size="large"
                                    placeholder="Company Phone"
                                    defaultCountry="VN"
                                    international
                                    value={phone}
                                    onChange={setPhone} />
                            </Form.Item>


                            <Form.Item
                                label="Company Address"
                                labelCol={{ span: '24' }}
                                name="address"
                                rules={[{ required: true, }]}
                            >
                                <Input style={{ height: `50px` }} size="large" placeholder="e.g: Nguyen Van Mai Street, District 3, Ho Chi Minh City, Vietnam" />
                            </Form.Item>


                            <Form.Item style={{ marginBottom: `10px` }}>
                                <Button type='primary' size="large" shape="round" htmlType="submit" style={{ width: `100%`, height: `50px` }}>
                                    Send
                                </Button>
                            </Form.Item>
                            <Form.Item style={{ marginBottom: `10px` }}>
                                <Divider>or</Divider>

                            </Form.Item>
                            <Form.Item style={{ marginBottom: `10px` }}>
                                <Button size="large" type='link'>
                                    <NavLink to="/">Go home</NavLink>
                                </Button>
                            </Form.Item>

                        </Form>
                    </div>
                </div>}
            </>
        },
        [success, phone, err, userLogin, history, dispatch]
    );
    return (
        <>{renderPage()}</>
    )
}
