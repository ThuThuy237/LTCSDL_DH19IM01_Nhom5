import React, { useState } from 'react';
import {
    Row,
    Col,
    Avatar,
    Card,
    Button,
    Modal,
    Form,
    Input,
    Upload
} from 'antd';
import { DoubleRightOutlined, CameraOutlined } from '@ant-design/icons';
import { useSelector, useDispatch } from 'react-redux';
import styles from '../../Styles/InfoUser.module.scss';
import { actChangeInfo, actChangeAvatar } from '../../reducers/Login/action';


export default function InfoUser() {
    const { userLogin } = useSelector(state => state.LoginReducer);
    const dispatch = useDispatch();

    const [isModalVisible, setIsModalVisible] = useState(false);
    const [isModalVisible2, setIsModalVisible2] = useState(false);
    const [fileAva, setFileAva] = useState(null);
    const [url, setUrl] = useState(null);

    const [form] = Form.useForm();

    const renderView = React.useCallback(() => {
        const formData = new FormData();
        const showModal = () => {
            setIsModalVisible(true);
        };

        const handleCancel = () => {
            setIsModalVisible(false);
        };
        const showModal2 = () => {
            setIsModalVisible2(true);
        };

        const handleCancel2 = () => {
            setIsModalVisible2(false);
        };
        const changeAva = (info) => {
            const { status } = info.file;
            if (status === 'done') {
                let file = info.file;
                let reader = new FileReader();
                // //Đọc file
                reader.readAsDataURL(file.originFileObj);
                // //Sau khi đọc file chạy hàm onload để thay đổi hình
                reader.onload = async (e) => {
                    setUrl(e.target.result);
                }
                setFileAva(file.originFileObj);  
            } else if (status === 'error') {
                console.log("info");
            }
        }
        const renderReview = () => {
            return <Avatar size={120} src={url ? url : ''} />;
        }
        const dummyRequest = ({ file, onSuccess }) => {
            setTimeout(() => {
                onSuccess("ok");
            }, 0);
        };
        return <>
            {userLogin ? <>
                <Row >
                    <Col span={24}><h1 className={styles.titlePage}><span>User Profile</span></h1></Col>
                </Row>
                <Row justify="space-around" align="center">
                    <Col span={8}><Card style={{ textAlign: "center" }} className={styles.cardInfo}>
                        <Button onClick={showModal2} type="link" className={styles.editBtn}>Edit</Button>
                        {userLogin.avatar ? <Avatar size={120} src={userLogin.avatar} /> :
                            <Avatar size={120} style={{ fontSize: "2.5rem" }}>{userLogin.username.charAt(0).toUpperCase()}</Avatar>}
                        <h2 className={styles.avaName}>{userLogin.username}</h2>
                        <p><strong>Account role: </strong>{userLogin.type.toUpperCase()}</p>
                    </Card></Col>
                    <Col span={12}><Card style={{ fontSize: "1.1rem" }} className={styles.cardInfo}>
                        <Row className={styles.rowInfo}>
                            <Col span={8} ><strong>First Name</strong></Col>
                            <Col span={16} className={styles.grayLabel}>{userLogin.first_name ? userLogin.first_name : "..."}</Col>
                        </Row>
                        <Row className={styles.rowInfo}>
                            <Col span={8}><strong>Last Name</strong></Col>
                            <Col span={16} className={styles.grayLabel}>{userLogin.last_name ? userLogin.last_name : "..."}</Col>
                        </Row>
                        <Row className={styles.rowInfo}>
                            <Col span={8}><strong>Email</strong></Col>
                            <Col span={16} className={styles.grayLabel}>{userLogin.email ? userLogin.email : "..."}</Col>
                        </Row>
                        {/* <Row className={styles.rowInfo}>
                            <Col span={8}><strong>Phone</strong></Col>
                            <Col span={16} className={styles.grayLabel}>{userLogin.jobApplicant ? userLogin.jobApplicant.phone : "..."}</Col>
                        </Row>
                        <Row className={styles.rowInfo}>
                            <Col span={8}><strong>Address</strong></Col>
                            <Col span={16} className={styles.grayLabel}>{userLogin.jobApplicant ? userLogin.jobApplicant.address : "..."}</Col>
                        </Row> */}
                        <Row style={{ margin: "10px" }}>
                            <Button type="primary" shape="round" size="large" onClick={showModal}>
                                Edit
                            </Button>
                        </Row>
                    </Card></Col>
                </Row>
                <Modal title="Edit Avatar"
                    visible={isModalVisible2}
                    okText="Change"
                    onCancel={handleCancel2}
                    onOk={() => {   
                        formData.append("avatar", fileAva);
                        console.log(formData.get('avatar'));
                        if (formData.get('avatar') != null) { dispatch(actChangeAvatar(formData)); }
                        // close modal                     
                    }}>
                    <Row justify="space-around" align="middle">
                        <Col span={6} id={styles.changeAvaContainer}>
                            {userLogin.avatar ?
                                <>
                                    {/* onError for avatar*/}
                                    <Avatar size={120} src={userLogin.avatar} />
                                    <Upload
                                        maxCount={1}
                                        style={{ display: 'contents' }}
                                        customRequest={dummyRequest}
                                        onChange={changeAva}
                                    >
                                        <Avatar className={styles.cam} size={120} icon={<CameraOutlined />} />
                                    </Upload>
                                </> :
                                <>
                                    <Avatar size={120} style={{ fontSize: "4rem" }}>{userLogin.username.charAt(0).toUpperCase()}</Avatar>
                                    <Upload
                                        maxCount={1}
                                        style={{ display: 'contents' }}
                                        customRequest={dummyRequest}
                                        onChange={changeAva}
                                    >
                                        <Avatar className={styles.cam} size={120} icon={<CameraOutlined />} />
                                    </Upload>
                                </>}
                        </Col>
                        <Col span={4} style={{ textAlign: "center" }}><DoubleRightOutlined style={{ fontSize: "4em" }} /></Col>
                        <Col span={6}>
                            {renderReview()}
                        </Col>
                    </Row>
                </Modal>
                <Modal title="Edit User Information"
                    visible={isModalVisible}
                    okText="Update"
                    onCancel={handleCancel}
                    onOk={() => {
                        form
                            .validateFields()
                            .then(values => {
                                form.resetFields();
                                setIsModalVisible(false);
                                values = {
                                    firstName: values.firstName ? values.firstName : null,
                                    lastName: values.lastName ? values.lastName : null,
                                    email: values.email ? values.email : null,
                                    // address: values.address ? values.address : null,
                                    // phone: values.phone ? values.phone : null,
                                    id: userLogin.id,
                                }
                                console.log(values);
                                dispatch(actChangeInfo(values));
                            })
                            .catch(info => {
                                console.log('Validate Failed:', info);
                            });
                    }}>
                    <Form
                        name="basic"
                        labelCol={{ span: 6 }}
                        labelAlign="left"
                        wrapperCol={{ span: 18 }}
                        initialValues={{
                            firstName: userLogin.first_name ? userLogin.first_name : null,
                            lastName: userLogin.last_name ? userLogin.last_name : null,
                            email: userLogin.email ? userLogin.email : null,
                            // phone: userLogin.jobApplicant ? userLogin.jobApplicant.phone : null,
                            // address: userLogin.jobApplicant ? userLogin.jobApplicant.address : null,
                        }}
                        form={form}
                    >
                        <Form.Item
                            name="firstName"
                            label="First Name"
                        >
                            <Input style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder={userLogin.firstName ? userLogin.firstName : "First Name"} />
                        </Form.Item>
                        <Form.Item
                            name="lastName"
                            label="Last Name"
                        >
                            <Input style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder={userLogin.lastName ? userLogin.lastName : "Last Name"} />
                        </Form.Item>
                        <Form.Item
                            name="email"
                            label="Email"
                            rules={[{
                                type: 'email',
                                message: 'The input is not valid E-mail!',
                            }]}

                        >
                            <Input style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder={userLogin.email ? userLogin.email : "Email"} />
                        </Form.Item>
                        {/* <Form.Item
                            name="phone"
                            label="Phone"
                        >
                            <Input style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder={userLogin.phone ? userLogin.phone : "Phone number"} />
                        </Form.Item>
                        <Form.Item
                            name="address"
                            label="Address"
                        >
                            <Input style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder={userLogin.jobApplicant? userLogin.jobApplicant.address : "Address"} />
                        </Form.Item> */}

                    </Form>
                </Modal></> : ""}
        </>
    }, [userLogin, dispatch, form, isModalVisible, isModalVisible2, url, fileAva])

    return (
        <>
            {renderView()}
        </>
    )
}
