import { Row, Col, Pagination } from 'antd';
import React, { useEffect, useCallback, } from 'react';
import JobCard from '../Components/JobCard';
import { useDispatch, useSelector } from 'react-redux';
import { getListPost } from '../reducers/PostJob/action';
import Loading from '../Components/Loading';
import Error from '../Components/Error';
import Filter from '../Components/Filter';


export default function FindJob() {

    const dispatch = useDispatch();

    const {err, loading, listPost, currentPage} = useSelector(state => state.PostJobReducer);

    useEffect(() => {
        const action = getListPost('','','');
        dispatch(action);
    }, [dispatch])


    const renderListPost = useCallback(
        () => {
            if (loading) { return <Loading /> }
            if(err) { return <Error/>}
            if (listPost) {
                const paginationChange =(page)=>{
                    let stringPage = 'page='+page;
                    const action = getListPost('', stringPage);
                    dispatch(action);
                }
                return <>
                    <Row className="container mb-5">
                        <Col span={16}>
                            {listPost.results?.map(post => {
                                return <JobCard
                                    key={post.id}
                                    id={post.id}
                                    title={post.title}
                                    location={post.location}
                                    subtitle={post.subtitle}
                                    image={post.image}
                                    created_date={post.created_date}
                                    category={post.category}
                                    salary={post.salary}
                                />
                            })}
                            <Pagination defaultCurrent={currentPage} pageSize={5} total={listPost.count} onChange={paginationChange} className="text-center mt-1 mb-5" />
                        </Col>
                        <Col span={7} offset={1}><Filter/></Col>
                    </Row>
                </>
            }
        },
        [listPost, loading, err, dispatch, currentPage]
    );
    return (
        <>
            {renderListPost()}
        </>
    )
}
