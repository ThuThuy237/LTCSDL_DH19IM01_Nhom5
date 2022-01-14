import React, { useCallback } from 'react';
import {
    Table,
    Radio, Modal, Timeline
} from 'antd';
import { CheckCircleOutlined,
    CloseCircleOutlined,
    ClockCircleOutlined, 
    EnvironmentOutlined, 
    PhoneOutlined, 
    MailOutlined,
    ExclamationCircleOutlined } from "@ant-design/icons";
import { useDispatch } from 'react-redux';
import { actChangeStatus } from '../reducers/Apply/action';
import { getUserLogin } from '../reducers/Login/action';

const { confirm } = Modal;

export default function TableApplicans(props) {
    const dispatch = useDispatch();

    const info = (phone, address, email) => {
        Modal.info({
            title: <h3 style={{color: "#5bc0de"}}>Information about applicant</h3>,
            width: '650px',
            content: (
                <div className="pt-4">
                    <Timeline>
                        <Timeline.Item style={{fontSize: '1.3rem'}} color="green" dot={<MailOutlined style={{ fontSize: '16px' }} />}>Email: {email}</Timeline.Item>
                        <Timeline.Item style={{fontSize: '1.3rem'}} color="green" dot={<PhoneOutlined style={{ fontSize: '16px' }} />}>Phone: {phone}</Timeline.Item>
                        <Timeline.Item style={{fontSize: '1.3rem'}} className="p-0" color="green" dot={<EnvironmentOutlined style={{ fontSize: '16px' }} />}>Address: {address}</Timeline.Item>
                    </Timeline>
                </div>
            ),
            onOk() { },
        });
    }

    const renderView = useCallback(
        () => {
            if (props.data) {
                const columns = [
                    {
                        title: 'Applicant',
                        dataIndex: 'applicant',
                        key: 'title.user',
                        render: obj => <>
                            Applicant Name: <strong className="text-capitalize" style={{fontSize:"1.3rem"}}>{obj.user}</strong>

                            {obj.cv ? <a href={obj.cv} target="_blank" rel="noreferrer" className="mx-3 btn btn-outline-info">Cv</a> : ""}
                            {obj.cover_letter ? <a href={obj.cover_letter} target="_blank" rel="noreferrer" className="btn btn-outline-success">Coverletter</a> : ""}
                            {obj.phone || obj.address || obj.email ? <button
                                onClick={() => info(obj.phone, obj.address, obj.email)}
                                className="mx-3 btn btn-outline-primary"
                            >
                                More info
                            </button> : ""}

                        </>,
                    },
                    {
                        title: 'Apply date',
                        dataIndex: 'date_apply',
                        key: 'date',
                    },
                    {
                        title: 'Status',
                        dataIndex: 'status',
                        key: 'status',
                        filters: [
                            { text: 'Pass', value: 'A' },
                            { text: 'Refuse', value: 'R' },
                            { text: 'Pending', value: 'P' },
                        ],
                        onFilter: (value, record) => record.status.includes(value),
                        render: (text, record) => (<>
                            <Radio.Group 
                            defaultValue={text} 
                            size="large" 
                            className="d-flex flex-column justify-content-center"
                            onChange={(value)=>{
                                confirm({
                                    title: 'Do you Want to delete these items?',
                                    icon: <ExclamationCircleOutlined className="text-info" />,
                                    content: 'Some descriptions',
                                    onOk() {
                                        dispatch(actChangeStatus(value.target.value, record.id));
                                    },
                                    onCancel() {
                                        dispatch(getUserLogin());
                                    },
                                  });
                            }} >
                                <Radio value="A" className="mr-3 py-1"><CheckCircleOutlined className="text-success mr-2" style={{ fontSize: "1.7rem" }} /> Pass</Radio>
                                <Radio value="R" className="mr-3 py-1"><CloseCircleOutlined className="text-danger mr-2" style={{ fontSize: "1.7rem" }} /> Refuse</Radio>
                                <Radio value="P" className="mr-3 py-1" disabled="disabled">
                                    <ClockCircleOutlined className="text-warning mr-2" style={{ fontSize: "1.7rem" }} />
                                    Pending
                                </Radio>
                            </Radio.Group>
                        </>)
                    },

                ];
                return <Table columns={columns} dataSource={props.data} />
            }
        }, [props, dispatch])
    return (
        <>
            {renderView()}
        </>
    )
}
