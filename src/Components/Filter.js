import React, { useState, useEffect } from 'react';
import myStyles from '../Styles/Filter.module.scss';
import { Button, Divider, Select, Row, Col, Slider, Form, Input, } from 'antd';
import { useDispatch, useSelector} from 'react-redux';
import { getListCategory, getListLocation } from '../reducers/GetResource/action';
import {  getListPost } from '../reducers/PostJob/action';


const { Option } = Select;

export default function Filter() {   
    const [form] = Form.useForm();
    const dispatch = useDispatch();
    const [salary, setSalary] = useState(0)

    const { listCategory, listLocation } = useSelector(state => state.GetResourceReducer);

    const onChange = (value) => {
        setSalary(value)
    };
    const onFinish = (values) => {
        let data = {
            ...values,
        }
        const action = getListPost(data);
        dispatch(action);
    };
    useEffect(() => {   
        dispatch(getListCategory());
        dispatch(getListLocation());
    }, [dispatch])
    return (
        <>
            <div className={myStyles.filterContainer}>
                <Form
                    name="search"
                    form={form}
                    style={{ justifyContent: 'center' }}
                    onFinish={onFinish}
                >
                    <Form.Item
                    >
                        <Row className={myStyles.headers}>
                            <Col span={10} offset={2}>Advanced Search</Col>
                            <Col span={8} offset={2}>
                                <Button
                                    style={{ color: 'rgb(123 123 123)' }}
                                    size='small'
                                    type='text'
                                    onClick={() => {
                                        form.resetFields();
                                        setSalary(0)
                                    }}>Clear All</Button>
                            </Col>
                        </Row>
                    </Form.Item>
                    <Divider />
                    <Row>
                        <Col span={12} offset={2} className="my-2">Key word</Col>
                        <Col span={20} offset={2}>
                        <Form.Item name="kw">
                            <Input placeholder='Key word' size="large"/>
                        </Form.Item>
                        </Col>
                    </Row>

                    <Row>
                        <Col span={12} offset={2} className="my-2">Category</Col>
                        <Col span={20} offset={2}>
                            <Form.Item
                                name="category"
                            >
                                <Select placeholder="Select category" size="large">
                                {listCategory?.results?.map(category =>{
                                    return <><Option key={category.id} value={category.id}>{category.name}</Option></>
                                })}
                                </Select>
                            </Form.Item>
                        </Col>
                    </Row>

                    <Row>
                        <Col span={12} offset={2} className="my-2">Location</Col>
                        <Col span={20} offset={2}>
                            <Form.Item
                                name="location"
                            >
                                <Select placeholder="Select location" size="large" >
                                {listLocation?.results?.map(location =>{
                                    return <><Option key={location.id} value={location.id}>{location.city}, {location.country}</Option></>
                                })}
                                </Select>
                            </Form.Item>
                        </Col>

                    </Row>

                    <Row>
                        <Col span={12} offset={2} className="my-2">Salary</Col>
                        <Col span={12} offset={2} style={{ marginTop: '10px', marginBottom: '10px', textAlign: 'center' }}>More than: ${salary}</Col>
                        <Col span={20} offset={2}>
                            <Form.Item
                                name="salary"
                            >
                                <Slider
                                    initialValues={salary}
                                    max={2000}
                                    handleStyle={{ background: '#fff', borderColor: '#fa8914' }}
                                    trackStyle={{ background: 'linear-gradient(0.25turn, #fff0e5, #ff6c00)' }}
                                    onChange={onChange}
                                    tipFormatter={null} />
                            </Form.Item>
                        </Col>
                    </Row>
                    <Divider />

                    <Form.Item style={{ textAlign: 'center' }}>
                        <Button type="primary" htmlType="submit" style={{ borderRadius: '10px', }} size="large">
                            Search
                        </Button>
                    </Form.Item>
                </Form>
            </div>
        </>
    )
}
