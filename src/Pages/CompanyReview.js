import React, { useEffect, useCallback } from 'react';
import { Row, Col, Card, Rate } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { getListRecruiter } from '../reducers/Recruiter/action';
import Loading from '../Components/Loading';
import Error from '../Components/Error';
import { Link } from 'react-router-dom';

export default function CompanyReview() {
    const { listRecruiter, loading, err } = useSelector(state => state.RecruiterReducer);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(getListRecruiter());
    }, [dispatch])

    const renderView = useCallback(() => {
        if (loading) { return <Loading /> }
        if (err) { return <Error /> }
        if (listRecruiter) {
            return <>
                {listRecruiter.map(item => {
                    return <Col className="gutter-row" span={8}>
                        <Link to={`/company/${item.user.id}`} >
                            <Card bodyStyle={{ padding: '10px' }}>
                                <Row>
                                    <Col span={8}>
                                        <img className="img-fluid" src={item.logo_image} alt="companyLogo" onError={e => e.target.src = "https://cdn.logo.com/hotlink-ok/logo-social.png"} />
                                    </Col>
                                    <Col span={15} offset={1}>
                                        <h5 className="font-weight-bold">{item.company_name}</h5>
                                        <p className="text-muted">{item.contact_email}</p>
                                        <p>Rating: <Rate disabled allowHalf defaultValue={item.avg_rating} /> </p>
                                        <p>{item.avg_rating} / 5</p>
                                    </Col>
                                </Row>
                            </Card>
                        </Link>
                    </Col>
                })}
            </>
        }
    }, [listRecruiter, loading, err,])
    return (
        <div className="container my-5">
            <Row gutter={[16, 24]}>
                {renderView()}
            </Row>
        </div>
    )
}
