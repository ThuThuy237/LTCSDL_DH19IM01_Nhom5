import React, { useState, useEffect } from 'react';
import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { getListCategory, getListLocation, getListTag } from '../reducers/GetResource/action';
import {
    Form,
    Select,
    InputNumber,
    Switch,
    Radio,
    Button,
    Upload,
    Drawer,
    Input,
    Tooltip,
} from 'antd';
import { InboxOutlined, EyeOutlined } from '@ant-design/icons';
import { useDispatch, useSelector } from 'react-redux';
import { getRecruiter, actUpdatePost } from '../reducers/Recruiter/action';
import ReviewPost from './ReviewPost'
import { useHistory } from 'react-router-dom';

export default function CreatePostForm(props) {
    const { Option } = Select;
    const [form] = Form.useForm();
    const formData = new FormData();
    const dispatch = useDispatch();
    const history = useHistory();
    const { listCategory, listLocation, listTag } = useSelector(state => state.GetResourceReducer);
    const { userLogin } = useSelector(state => state.LoginReducer);
    const [statusSalary, setStatusSalary] = useState(false);
    const [salary, setSalary] = useState(null);
    const [visible, setVisible] = useState(false);
    const onClose = () => {
        setVisible(false);
    };
    const showLargeDrawer = () => {
        setVisible(true);
    };
    const changeStatusSalary = (b) => {
        setStatusSalary(b);
    }

    const desData = `<h3><strong>JOB DESCRIPTION</strong></h3><p><strong> 'Job Positions' (2 Positions - Working in 'Location as HCM')</strong></p><ul><li>Job description 1;</li><li>Job description 2;</li><li>Job description 3;</li><li>Job description 4;</li><li>Job description 5;</li></ul><h3><strong>JOB REQUIREMENT</strong></h3><ul><li>A total of 3-5+ year experience, of which 2+ years should be in investments (preferably VC/PE funds), ....</li><li>Strong research and modelling skills</li><li>Strong skills in preparing presentations and MS Office</li><li>Fluent in Vietnamese/English</li><li>Good to have:</li><li>Experience in working on transaction documents</li></ul><h3><strong>MORE INFORMATION</strong></h3><ul><li>Degree: Bachelor</li><li>Job type : Permanent</li><li>Age: Unlimited</li></ul>`
    const formItemLayout = {
        labelCol: { span: 6 },
        wrapperCol: { span: 18 },
    };

    const [imgSrc, setImgSrc] = useState(props.obj?.image)
    const handleChangeFile = async (info) => {
        let file = info.fileList[0]
        if (file) {
            setImgSrc(URL.createObjectURL(file.originFileObj));
        }
        else {
            setImgSrc(props.obj.image);
        }


    }
    const dummyRequest = ({ file, onSuccess }) => {
        setTimeout(() => {
            onSuccess("ok");
        }, 0);
    };
    const inputSalary = (value) => {
        setSalary(value);
    }
    const onFinish = (values) => {
        for (let key in values) {
            if (key === 'image' && values[key] !== null) {
                if(values[key] instanceof File)
                    formData.append(key, values[key].file.originFileObj);
            }
            else {
                formData.append(key, values[key])
            }
            // console.log(key, values[key]);
        }
        dispatch(actUpdatePost(formData, props.id, history));
    };

    useEffect(() => {
        dispatch(getListCategory());
        dispatch(getListLocation());
        dispatch(getListTag());
        dispatch(getRecruiter(userLogin.id));
    }, [dispatch, userLogin])
    return (
        <div className="d-flex justify-content-center">
            <Form
                name="validate_other"
                form={form}
                labelAlign="left"
                {...formItemLayout}
                onFinish={onFinish}
                initialValues={props.obj? props.obj: {
                    'salary': "0",
                    'active': true,
                    'description': desData,
                }}
            >
                <Form.Item label="Title" name="title" rules={[{ required: true, message: 'Please input Title' }]}>
                    <Input />
                </Form.Item>

                <Form.Item
                    name="category"
                    label="Category"
                    hasFeedback
                    rules={[{ required: true, message: 'Please select category!' }]}
                >
                    <Select placeholder="Please select a category">
                        {listCategory?.results?.map(category => {
                            return <><Option key={category.id} value={category.id}>{category.name}</Option></>
                        })}
                    </Select>
                </Form.Item>

                <Form.Item
                    name="tags"
                    label="Tags"
                >
                    <Select mode="multiple" placeholder="Please select tags">
                        {listTag?.results?.map(tag => {
                            return <><Option key={tag.id} value={tag.id}>{tag.name}</Option></>
                        })}
                    </Select>
                </Form.Item>
                <Form.Item
                    name="location"
                    label="Location"
                    hasFeedback
                    rules={[{ required: true, message: 'Please select location!' }]}
                >
                    <Select placeholder="Please select a location">
                        {listLocation?.results?.map(location => {
                            return <><Option key={location.id} value={location.id}>{location.city}, {location.country}</Option></>
                        })}
                    </Select>
                </Form.Item>
                <Form.Item label="Address" name="address" >
                    <Input />
                </Form.Item>
                <Form.Item name="active" label="Status" valuePropName="checked">
                    <Switch />
                </Form.Item>

                <Form.Item name="salary" label="Salary" rules={[{ required: true, message: 'Please select hide salary or input salary!' }]}>
                    <Radio.Group>
                        <Tooltip title="The post will show Negotiation if you choose hide">
                            <Radio value="0" onClick={() => changeStatusSalary(false)}>Hide</Radio>
                        </Tooltip>

                        <Radio value={salary} onClick={() => changeStatusSalary(true)}>
                            Input: <InputNumber
                                disabled={statusSalary ? "" : "disabled"}
                                formatter={value => `$ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')}
                                onChange={inputSalary} />
                        </Radio>
                    </Radio.Group>
                </Form.Item>


                <Form.Item label="Post image" valuePropName="file" name="image"
                    rules={[{ required: true, message: 'Please select image for post, you can upload your company logo!' }]}>
                    <Upload.Dragger customRequest={dummyRequest} multiple={false} maxCount={1} accept='image/*' onChange={handleChangeFile}>
                        <p className="ant-upload-drag-icon">
                            <InboxOutlined />
                        </p>
                        <p className="ant-upload-text">Click or drag file to this area to upload</p>
                        <p className="ant-upload-hint">Support for a single upload.</p>
                    </Upload.Dragger>
                </Form.Item>
                <div>Preview Images:</div>
                <img style={{ width: 250 }} className="mb-4 mx-auto d-flex" src={imgSrc} alt="..." />
                <Form.Item name="description" label="Description">
                    <CKEditor
                        editor={ClassicEditor}
                        data={desData}
                        onChange={(event, editor) => {
                            const data = editor.getData();
                            form.setFieldsValue({
                                description: data
                            });

                        }}
                    />
                </Form.Item>

                <Form.Item wrapperCol={{ span: 12, offset: 10 }}>
                    <button type="button" className="btn btn-info rounded mx-5" onClick={showLargeDrawer}>
                        Preview <EyeOutlined style={{ fontSize: '1.3rem' }} />
                    </button>
                    <Button type="primary" size="large" className="rounded" htmlType="submit">
                        Submit
                    </Button>

                </Form.Item>
            </Form>
            <Drawer
                title="Preview new post"
                placement="right"
                width="1024px"
                onClose={onClose}
                visible={visible}
            >
                <ReviewPost title={form.getFieldValue("title")}
                    description={form.getFieldValue("description")}
                    tags={form.getFieldValue("tags")}
                    salary={form.getFieldValue("salary")}
                    location={form.getFieldValue("location")}
                    category={form.getFieldValue("category")}
                    image={form.getFieldValue("image")}
                    address={form.getFieldValue("address")} />
            </Drawer>
        </div>
    )
}
