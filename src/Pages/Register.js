import React, {useEffect} from 'react'
import myStyles from '../Styles/RegisterStyle.module.scss';
import { FcGoogle } from 'react-icons/fc';
import { Form, Input, Button, Divider } from 'antd';
import { actLoginGG, actRegister, getUserLogin } from '../reducers/Login/action';
import { NavLink } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { useHistory } from "react-router-dom";
import { GoogleLogin } from 'react-google-login';

export default function Register() {
    const dispatch = useDispatch();
    let history = useHistory();

    const {userLogin } = useSelector(state => state.LoginReducer);

    useEffect(() => {
        dispatch(getUserLogin(history));
    }, [dispatch, history]);

    const renderPage = React.useCallback(
        () => {
            // const openNotification = (mess, description) => {
            //     notification.open({
            //         message: mess,
            //         description:
            //             description,
            //         placement: 'bottomRight',
            //         type: 'error',
            //         style: {
            //             width: 400,
            //         },
            //     });
            // };
            const onFinish = (values) => {
                const action = actRegister(values, history);
                dispatch(action);
            };

            const onFinishFailed = (errorInfo) => {
                console.log('Failed:', errorInfo);
            };
            const responseGoogle = (response) => {
                const action = actLoginGG(response.accessToken, history);
                dispatch(action);
            }

            return <>
                {/* {err === null ? '' : openNotification(Object.keys(err)[0], err[Object.keys(err)[0]])} */}
                {userLogin === null ? <>
                    <div className={myStyles.register}>
                        <div className={myStyles.registerContainer}>
                            <h1 >
                                CREATE ACCOUNT
                            </h1>

                            <Form
                                name="basic"
                                initialValues={{ remember: true }}
                                onFinish={onFinish}
                                onFinishFailed={onFinishFailed}
                            >
                                <Form.Item
                                    name="username"
                                    rules={[{ required: true, message: 'Please input your username!' }]}
                                >
                                    <Input style={{ height: `50px` }} size="large" placeholder="Username" />
                                </Form.Item>

                                <Form.Item
                                    name="email"
                                    rules={[{ required: true, message: 'Please input your email!', type: 'email' }]}
                                >
                                    <Input style={{ height: `50px` }} size="large" placeholder="Email" />
                                </Form.Item>

                                <Form.Item
                                    name="password"
                                    rules={[{ required: true, message: 'Please input your password!' }]}
                                >
                                    <Input.Password style={{ height: `50px` }} size="large" placeholder="Password (6 or more characters)" />
                                </Form.Item>

                                <Form.Item
                                    name="confirm"
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
                                    <Input.Password style={{ height: `50px` }} size="large" placeholder="Confirm your password" />
                                </Form.Item>

                                <Form.Item style={{ marginBottom: `10px` }}>
                                    <Button type='primary' size="large" shape="round" htmlType="submit" style={{ width: `100%`, height: `50px` }}>
                                        Sign up
                                    </Button>
                                </Form.Item>

                                <Form.Item style={{ marginBottom: `10px` }}>
                                    <Divider>or</Divider>
                                </Form.Item>

                                <Form.Item >
                                    <GoogleLogin
                                        clientId="143666509308-7k0rlo8ijp6ar4uutfjp3biifcijo017.apps.googleusercontent.com"
                                        render={renderProps => (
                                            <Button onClick={renderProps.onClick} disabled={renderProps.disabled} size="large" shape="round" style={{ width: `100%`, height: `50px` }} >
                                                <FcGoogle style={{ fontSize: '40px', paddingRight: '10px' }} /> Sign up with Google
                                            </Button>
                                        )}
                                        onSuccess={responseGoogle}
                                        onFailure={responseGoogle}
                                        cookiePolicy={'single_host_origin'}
                                    />
                                </Form.Item>

                                <Form.Item style={{ marginBottom: `10px` }}>
                                    <div style={{ textAlign: 'center' }}>
                                        Have an account? <NavLink to="/login">Sign in</NavLink>
                                    </div>
                                </Form.Item>

                            </Form>
                        </div>
                    </div>
                </> : history.goBack()}
            </>
        }, [ userLogin, history, dispatch])
    return (
        <>{renderPage()}</>
    )
}
