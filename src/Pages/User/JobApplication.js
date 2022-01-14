import React, { useState } from 'react';
import {
    Row,
    Col,
    Tabs,
    Upload,
    message,
    Button,
    Empty
} from 'antd';
import { InboxOutlined } from '@ant-design/icons';
import { useSelector, useDispatch } from 'react-redux';
import styles from '../../Styles/InfoUser.module.scss';
import { actUploadCoverLetter, actUploadCv } from '../../reducers/Login/action';

export default function InfoUser() {
    const { userLogin } = useSelector(state => state.LoginReducer);
    const formData = new FormData();
    const formLetter = new FormData();
    const dispatch = useDispatch();
    const [file, setFile] = useState(null);
    const [letter, setLetter] = useState(null);
    const changeTab = () => {

    }
    const { TabPane } = Tabs;
    const { Dragger } = Upload;

    const dummyRequest = ({ file, onSuccess }) => {
        setTimeout(() => {
            onSuccess("ok");
        }, 0);
    };
    const props1 = {
        name: 'file',
        multiple: false,
        accepts: ".doc, .docx, .pdf",
        onChange(info) {
            const { status } = info.file;
            if (status === 'done') {
                setFile(info.file);
                message.success(`${info.file.name} CV uploaded successfully.`);
            } else if (status === 'error') {
                message.error(`${info.file.name} CV upload failed.`);
            }
        }
    };
    const props2 = {
        name: 'file',
        multiple: false,
        accepts: ".doc, .docx, .pdf",
        onChange(info) {
            const { status } = info.file;
            if (status === 'done') {
                setLetter(info.file);
                message.success(`${info.file.name} Cover letter uploaded successfully.`);
            } else if (status === 'error') {
                message.error(`${info.file.name} Cover letter upload failed.`);
            }
        }
    };

    const uploadCv = () => {
        formData.append("cv", file.originFileObj);
        if (formData.get('cv') != null) { dispatch(actUploadCv(formData)); console.log(formData.get('cv')); }
    }
    const uploadCoverLetter = () => {
        if(letter != null){ formLetter.append("coverLetter", letter.originFileObj);}
        if (formLetter.get('coverLetter') != null) { dispatch(actUploadCoverLetter(formLetter)); console.log(formData.get('cv')); }
    }
    return (
        <>
            <Row >
                <Col span={24}><h1 className={styles.titlePage}><span>Job Applications</span></h1></Col>
            </Row>

            <Row justify="center" style={{ marginTop: '50px' }}>
                <Col span={23}>
                    <Tabs defaultActiveKey="1"
                        onChange={changeTab}
                        tabPosition="left"
                        size="large" >
                        <TabPane tab="Curriculum Vitae" key="1">
                            <Row justify="center" style={{ marginBottom: "50px" }}>
                                <Col style={{ textAlign: "center", height: 'fit-content', border: "1px solid gray", borderRadius: "20px" }}>
                                    <h1 style={{ marginTop: "10px" }}>Upload Curriculum Vitae</h1>
                                    <Dragger style={{ width: '60%', margin: "20px auto" }} {...props1} maxCount={1} customRequest={dummyRequest}>
                                        <p className="ant-upload-drag-icon">
                                            <InboxOutlined />
                                        </p>
                                        <p className="ant-upload-text">Click or drag file to this area to upload</p>
                                        <p className="ant-upload-hint">
                                            Support for a single or bulk upload. Strictly prohibit from uploading company data or other
                                            band files
                                        </p>
                                    </Dragger>
                                    {file ? <Button style={{ margin: "15px 0" }} type="primary" onClick={uploadCv} size="large" shape="round">Upload</Button> :
                                        <Button style={{ margin: "15px 0" }} disabled type="primary" size="large" shape="round">Upload</Button>}
                                </Col>
                            </Row>
                            {userLogin.jobApplicant?.cv ? <>
                                <Row justify="center">
                                <Col span={18} style={{ textAlign: "center" }}>
                                    <h1>Preview</h1>
                                    <iframe title="File" src={userLogin.jobApplicant?.cv} width="100%" height="900px">
                                    </iframe>
                                </Col>

                            </Row>
                            </> :
                                <Row justify="center">
                                    <Col span={18} style={{ textAlign: "center" }}>
                                        <Empty className="border rounded p-5" image={Empty.PRESENTED_IMAGE_SIMPLE} />
                                    </Col>
                                </Row>
                            }
                        </TabPane>
                        <TabPane tab="Cover Letter" key="2">
                            <Row justify="center" style={{ marginBottom: "50px" }}>
                                <Col style={{ textAlign: "center", height: 'fit-content', border: "1px solid gray", borderRadius: "20px" }}>
                                    <h1 style={{ marginTop: "10px" }}>Upload Cover Letter</h1>
                                    <Dragger style={{ width: '60%', margin: "20px auto" }} {...props2} maxCount={1} customRequest={dummyRequest}>
                                        <p className="ant-upload-drag-icon">
                                            <InboxOutlined />
                                        </p>
                                        <p className="ant-upload-text">Click or drag file to this area to upload</p>
                                        <p className="ant-upload-hint">
                                            Support for a single or bulk upload. Strictly prohibit from uploading company data or other
                                            band files
                                        </p>
                                    </Dragger>
                                    {letter ? <Button style={{ margin: "15px auto" }} type="primary" onClick={uploadCoverLetter} size="large" shape="round">Upload</Button> :
                                        <Button style={{ margin: "15px auto" }} disabled type="primary" size="large" shape="round">Upload</Button>}
                                </Col>
                            </Row>
                            {userLogin.jobApplicant?.cover_letter ? <>
                                <Row justify="center">
                                    <Col span={18} style={{ textAlign: "center" }}>
                                        <h1>Preview</h1>
                                        <iframe title="File" src={userLogin.jobApplicant?.cover_letter} width="100%" height="900px">
                                        </iframe>
                                    </Col>
                                </Row>
                            </> :
                                <Row justify="center">
                                    <Col span={18} style={{ textAlign: "center" }}>
                                        <Empty className="border rounded p-5" image={Empty.PRESENTED_IMAGE_SIMPLE} />
                                    </Col>
                                </Row>
                            }

                        </TabPane>
                    </Tabs>
                </Col>
            </Row>


        </>
    )
}
