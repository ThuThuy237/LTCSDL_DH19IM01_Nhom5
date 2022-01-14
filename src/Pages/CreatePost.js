import React, { useState } from 'react';
import { Steps, Button, Row, Col, Input, Select, } from 'antd';
import styles from '../Styles/RegisterRecruiter.module.scss';
import { useMediaQuery } from 'react-responsive';
import { PlaySquareOutlined, GlobalOutlined, SafetyCertificateOutlined } from '@ant-design/icons';
// import { actCreate } from '../reducer/action';
// import { useDispatch,  } from 'react-redux';
// import { useHistory } from "react-router-dom";

const { Step } = Steps;
const { Option } = Select;

export default function CreatePost() {
    const isPhone = useMediaQuery({
        query: '(max-width: 46.1875em)'
    });
    // const history = useHistory();
    // const dispatch = useDispatch();
    const [current, setCurrent] = useState(0);
    const [type, setType] = useState({type: ''});
    const [subject, setSubject] = useState();
    const [cate, setCate] = useState();
    const [fee, setFee] = useState({fee: ''});
    const [iDisabledNex, setDisabledNext] = useState(true);



    const changeStepNex = () => {
        setDisabledNext(true);
        setCurrent(current + 1);
    };

    const changeStepPre = () => {
        setDisabledNext(false);
        setCurrent(current - 1);
    };
    const handleChange = (value) => {
        setCate({ category_id: value });
        setDisabledNext(false);
    }

    const onClickType = (value) => {
        setType({ is_public: value });
        setDisabledNext(false);
    }

    const onClickFee = (value) => {
        setFee({ fee: value });
        setDisabledNext(false);
    }

    const onChangeSubject = (value) => {
        setSubject({name_course :value});
        if (value === '') {
            setDisabledNext(true);
        }
        else {
            setDisabledNext(false);

        }

    }
    const submit = () => {
        let data = { 
            ...type,
            ...subject,
            ...cate,
            ...fee,
        }
        console.log(data);
        // const action = actCreate(data);
        // // chuyển trang khác
        // history.push('/');
        // dispatch(action);
    }

    return (
        <div>
            {isPhone &&
                <Steps current={current} size="small">
                    <Step />
                    <Step />
                    <Step />
                    <Step />
                </Steps>}
            {!isPhone &&
                <Steps current={current} progressDot style={{ padding: '10px 0' }} >
                    <Step title="Step 1" description="Type of course (public or private)." />
                    <Step title="Step 2" description="Title (subject) of course." />
                    <Step title="Step 3" description="Category of course." />
                    <Step title="Step 4" description="Fee (amount) of course." />
                </Steps>}

            <div className={current === 0 ? styles.stepContainer : styles.hidden}>
                <Row><h1 className={styles.header}>First, let's find out what type of course you're making.</h1></Row>
                <Row className={styles.stepContent} justify="space-around" >
                    <Col span={6} className={type['is_public'] ===1?styles.btnPriPubChoose:styles.btnPriPub} onClick={() => { onClickType(1) }}>
                        <GlobalOutlined style={{ fontSize: '2rem' }} />
                        <span className={styles.title}>Public</span>
                        <span style={{ width: '100%' }}>Create a public course, anyone can freely participate in the course without your permission</span>

                    </Col >
                    <Col span={6} className={type['is_public'] ===0?styles.btnPriPubChoose:styles.btnPriPub} onClick={() => { onClickType(0) }}>
                        <SafetyCertificateOutlined style={{ fontSize: '2rem' }} />
                        <span className={styles.title}>Private</span>
                        <span>Create a private course, you can control who has access to your course</span>

                    </Col >
                </Row>
            </div>
            <div className={current === 1 ? styles.stepContainer : styles.hidden}>
                <Row><h1 className={styles.header}>How about a working title?.</h1></Row>
                <Row><p className={styles.header}>It's ok if you can't think of a good title now. You can change it later.</p></Row>
                <Row className={styles.stepContent} justify="space-around" >
                    <Input placeholder="E.g. Learn HTML from basic"
                        size='large'
                        className={styles.inputName}
                        onChange={(e) => { onChangeSubject(e.target.value); }} />
                </Row>
            </div>
            <div className={current === 2 ? styles.stepContainer : styles.hidden}>
                <Row><h1 className={styles.header}>How about a working title?.</h1></Row>
                <Row><p className={styles.header}>It's ok if you can't think of a good title now. You can change it later.</p></Row>
                <Row className={styles.stepContent} justify="space-around" >
                    <Select placeholder="Choose a category" className={styles.selectCate} onChange={handleChange}>
                        {/* get Category in database */}
                        <Option value={1}>Design</Option>
                        <Option value={2}>Web engineer</Option>
                        <Option value={3}>Business</Option>
                        <Option value={4}>Marketing</Option>
                    </Select>
                </Row>
            </div>
            <div className={current === 3 ? styles.stepContainer : styles.hidden}>
                <Row><h1 className={styles.header}>Do you want to create a paid course?</h1></Row>
                <Row className={styles.stepContent} justify="space-around" >
                    <Col span={6} className={fee['fee'] ==='Free'?styles.btnPriPubChoose:styles.btnPriPub} onClick={() => { onClickFee('Free') }}>
                        <PlaySquareOutlined style={{ fontSize: '2rem' }} />
                        <span className={styles.title}>Free</span>
                        <span style={{ width: '100%' }}>Create video courses and inspire students, you get to focus on that, and expanding your reach.</span>

                    </Col >
                    <Button disabled title="Comming soon..." style={{ maxWidth: '25%'}}className={styles.btnPriPubDisable}>
                        <PlaySquareOutlined style={{ fontSize: '2rem' }} />
                        <span className={styles.title}>Fee-based</span>
                        <span style={{ whiteSpace: 'pre-wrap' }}>Easily create, host, and Sell Courses, you can grow influence and increase your income</span>

                    </Button >
                    {/* Chọn tạo khóa học có phí :
                    <Col span={6} className={styles.btnPriPub} onClick={() => { onClickType('has fee') }}>
                        <PlaySquareOutlined style={{ fontSize: '2rem' }} />
                        <span className={styles.title}>Fee-based</span>
                        <span style={{ width: '100%' }}>Easily create, host, and Sell Courses, you can grow influence and increase your income</span>

                    </Col > */}
                </Row>
            </div>


            <Row className={styles.footer} justify="space-between" >
                <Col style={{ margin: '0 20px', minHeight: '40px'}}>
                    <Button
                        size='large'
                        className={current === 0 ? styles.hidden : styles.btnPre}
                        onClick={() => { changeStepPre() }}
                    >Previous</Button>
                </Col>
                <Col style={{ margin: '0 20px' , position: 'absolute', right: '0'}}>
                    <Button
                        id="btnNext"
                        size='large'
                        disabled={iDisabledNex ? 'disabled' : ''}
                        className={current === 3 ? styles.hidden : styles.btnNext}
                        onClick={() => { changeStepNex() }}
                    >Next</Button>
                </Col>
                <Col style={{ margin: '0 20px' }}>
                    <Button
                        id="btnNext"
                        size='large'
                        className={current === 3 ? styles.btnNext  : styles.hidden}
                        onClick={() => { submit() }}
                    >Create</Button>
                </Col>
            </Row>
        </div>
    )
}
