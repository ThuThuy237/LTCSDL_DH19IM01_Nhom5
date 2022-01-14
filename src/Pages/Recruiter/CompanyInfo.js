import React, { useState, useEffect } from 'react';
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
import { actChangeInfo, actChangeLogo, getRecruiter } from '../../reducers/Recruiter/action';
// import { actChangeInfo, actChangeAvatar } from '../../reducers/Login/action';


export default function CompanyInfo() {
    const { recruiter } = useSelector(state => state.RecruiterReducer);
    const { userLogin } = useSelector(state => state.LoginReducer);
    const dispatch = useDispatch();

    const [isModalVisible, setIsModalVisible] = useState(false);
    const [isModalVisible2, setIsModalVisible2] = useState(false);
    const [fileAva, setFileAva] = useState(null);
    const [url, setUrl] = useState(null);

    const [form] = Form.useForm();

    useEffect(() => {   
        dispatch(getRecruiter(userLogin.id));
    }, [dispatch, userLogin])
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
            {recruiter ? <>
                <Row >
                    <Col span={24}><h1 className={styles.titlePage}><span>Company Information</span></h1></Col>
                </Row>
                <Row justify="space-around" align="center">
                    <Col span={8}><Card style={{ textAlign: "center" }} className={styles.cardInfo}>
                        <Button onClick={showModal2} type="link" className={styles.editBtn}>Edit</Button>
                        {recruiter.logo_image ? <Avatar size={120} src={recruiter.logo_image} /> :
                            <Avatar size={120} style={{ fontSize: "2.5rem" }}>{recruiter.company_name.charAt(0).toUpperCase()}</Avatar>}
                        <h2 className={styles.avaName}>{recruiter.company_name}</h2>
                        <p><strong>Account Manager: </strong>{userLogin.username}</p>
                    </Card></Col>
                    <Col span={12}><Card style={{ fontSize: "1.1rem" }} className={styles.cardInfo}>
                        <Row className={styles.rowInfo}>
                            <Col span={8} ><strong>Company Name</strong></Col>
                            <Col span={16} className={styles.grayLabel}>{recruiter.company_name ? recruiter.company_name : "..."}</Col>
                        </Row>
                        <Row className={styles.rowInfo}>
                            <Col span={8}><strong>Contact Email</strong></Col>
                            <Col span={16} className={styles.grayLabel}>{recruiter.contact_email ? recruiter.contact_email : "..."}</Col>
                        </Row>
                        <Row className={styles.rowInfo}>
                            <Col span={8}><strong>Contact Phone</strong></Col>
                            <Col span={16} className={styles.grayLabel}>{recruiter.contact_phone ? recruiter.contact_phone : "..."}</Col>
                        </Row>
                        <Row className={styles.rowInfo}>
                            <Col span={8}><strong>Address</strong></Col>
                            <Col span={16} className={styles.grayLabel}>{recruiter.address ? recruiter.address : "..."}</Col>
                        </Row>
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
                        formData.append("logo", fileAva);
                        if (formData.get('logo') != null) { dispatch(actChangeLogo(formData)); }
                        // close modal                     
                    }}>
                    <Row justify="space-around" align="middle">
                        <Col span={6} id={styles.changeAvaContainer}>
                            {recruiter.logo_image ?
                                <>
                                    {/* onError for avatar*/}
                                    <Avatar size={120} src={recruiter.logo_image} />
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
                                    <Avatar size={120} style={{ fontSize: "4rem" }}>{recruiter.company_name.charAt(0).toUpperCase()}</Avatar>
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
                                    company_name: values.company_name ? values.company_name : null,
                                    contact_email: values.contact_email ? values.contact_email : null,
                                    address: values.address ? values.address : null,
                                    contact_phone: values.contact_phone ? values.contact_phone : null,
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
                            company_name: recruiter.company_name ? recruiter.company_name : null,
                            contact_email: recruiter.contact_email ? recruiter.contact_email : null,
                            contact_phone: recruiter.contact_phone? recruiter.contact_phone : null,
                            address: recruiter.address ? recruiter.address : null,
                        }}
                        form={form}
                    >
                        <Form.Item
                            name="company_name"
                            label="Company Name"
                        >
                            <Input style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder={recruiter.company_name ? recruiter.company_name : "First Name"} />
                        </Form.Item>
                        <Form.Item
                            name="contact_email"
                            label="Contact Email"
                            rules={[{
                                type: 'email',
                                message: 'The input is not valid E-mail!',
                            }]}

                        >
                            <Input style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder={recruiter.contact_email ? recruiter.contact_email : "contact_email"} />
                        </Form.Item>
                        <Form.Item
                            name="contact_phone"
                            label="Contact Phone"
                        >
                            <Input style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder={recruiter.contact_phone ? recruiter.contact_phone : "Phone number"} />
                        </Form.Item>
                        <Form.Item
                            name="address"
                            label="Address"
                        >
                            <Input style={{ height: `50px`, borderRadius: "10px" }} size="large" placeholder={recruiter.address ? recruiter.address : "Address"} />
                        </Form.Item>

                    </Form>
                </Modal></> : ""}
        </>
    }, [userLogin, recruiter, dispatch, form, isModalVisible, isModalVisible2, url, fileAva])

    return (
        <>
            {renderView()}
        </>
    )
}
