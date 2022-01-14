import React, { useEffect } from 'react'
import myStyles from '../Styles/LoginStyle.module.scss';
import { Form, Input, Button,  Divider } from 'antd';
import { NavLink } from 'react-router-dom';
import { actLogin, actLoginGG, getUserLogin } from '../reducers/Login/action';
import { useDispatch, useSelector } from 'react-redux';
import { useHistory } from "react-router-dom";
import { FcGoogle } from 'react-icons/fc';
import { GoogleLogin } from 'react-google-login';
import tt from '../Assets/Images/tt.png';

export default function Login() {
    let history = useHistory();

    const dispatch = useDispatch();

    const { userLogin } = useSelector(state => state.LoginReducer);

    useEffect(() => {
        dispatch(getUserLogin(history));
    },[dispatch, history]);

    const renderPage = React.useCallback(
        () => {
            const onFinishFailed = (errorInfo) => {
                console.log('Failed:', errorInfo);
            };
            const onFinish = (values) => {
                let user = values;
                const action = actLogin(user, history);
                dispatch(action);
            };

            const responseGoogle = (response) => {
                console.log(response);
                const action = actLoginGG(response.accessToken, history);
                dispatch(action);
            }
            return <>
                
                {userLogin === null ? <>
                    <div className={myStyles.login}>
                        <div className={myStyles.imageContainer}>
                            <div className={myStyles.logo}>
                                <div>
                                    <img alt="logo" src={tt} />
                                </div>
                            </div>
                        </div>
                        <p className={myStyles.headers}>
                            Welcome to your professional community
                        </p>

                        <Form
                            name="basic"
                            wrapperCol={{ span: 8 }}
                            initialValues={{ remember: true }}
                            onFinish={onFinish}
                            onFinishFailed={onFinishFailed}
                            style={{ marginLeft: 150 }}
                        >
                            <Form.Item
                                name="username"
                                rules={[{ required: true, message: 'Please input your username!' }]}
                            >
                                <Input style={{ height: `50px` }} size="large" placeholder="Username" />
                            </Form.Item>

                            <Form.Item
                                name="password"
                                rules={[{ required: true, message: 'Please input your password!' }]}
                            >
                                <Input.Password style={{ height: `50px` }} size="large" placeholder="Password" />
                            </Form.Item>

                            <Form.Item >
                                <Button type="link" style={{ padding: 0 }}>Forgot password?</Button>
                            </Form.Item>

                            <Form.Item style={{ marginBottom: `10px` }}>
                                <Button type='primary' size="large" shape="round" htmlType="submit" style={{ width: `100%`, height: `50px` }}>
                                    Sign in
                                </Button>
                            </Form.Item>

                            <Form.Item style={{ marginBottom: `10px` }}>
                                <Divider>or</Divider>

                            </Form.Item>

                            <Form.Item >
                                <GoogleLogin
                                    clientId="143666509308-7k0rlo8ijp6ar4uutfjp3biifcijo017.apps.googleusercontent.com"
                                    onSuccess={responseGoogle}
                                    onFailure={responseGoogle}
                                    cookiePolicy={'single_host_origin'}
                                    render={renderProps => (
                                        <Button onClick={renderProps.onClick} disabled={renderProps.disabled} size="large" shape="round" style={{ width: `100%`, height: `50px` }} >
                                            <FcGoogle style={{ fontSize: '40px', paddingRight: '10px' }} /> Continue with Google
                                        </Button>
                                    )}
                                />
                            </Form.Item>


                            <Form.Item style={{ marginBottom: `10px` }}>
                                <div style={{ textAlign: 'center' }}>
                                    Not a member? <NavLink to="/register">Join now</NavLink>
                                </div>
                            </Form.Item>
                        </Form>
                    </div>
                </> : history.goBack()}
            </>
        }, [userLogin, history, dispatch])
    return (
        <>{renderPage()}</>
    )
}
