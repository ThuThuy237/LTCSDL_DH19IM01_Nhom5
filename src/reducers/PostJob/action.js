import { http } from "../../api/http";
import * as Type from './type';
import { http_auth } from "../../api/http_auth";
import {Noti} from "../../Components/Noti";

export const getListPost = (data, page) => {
    return (dispatch) => {
        dispatch(actionGetPostRequest());
        http.get(`post/?${page?page:"page=1"}&category=${data.category? data.category:''}&location=${data.location? data.location:''}&kw=${data.kw? data.kw:''}&salary=${data.salary? data.salary:0}`).then((rs) => {
            dispatch(actionGetPostSuccess(rs.data));
            if(page) {
                dispatch(actionSetPage(parseInt(page.replace('page=', ''))));
            }
        }).catch((err) => {
            dispatch(actionGetPostFailed(err));  
        });
    }
}

export const getTopPost = () => {
    return (dispatch) => {
        dispatch(actionGetTopPostRequest());
        http.get('post/get-top5-lastest/').then((rs) => {
            dispatch(actionGetTopPostSuccess(rs.data));
        }).catch((err) => {
            dispatch(actionGetTopPostFailed(err));  
        });
    }
}


export const getOwnerPost = () => {
    return (dispatch) => {
        dispatch(actionGetOwnerRequest());
        http_auth.get('post/owner-get/').then((rs) => {
            dispatch(actionGetOwnerSuccess(rs.data));
        }).catch((err) => {
            dispatch(actionGetOwnerFailed(err));  
        });
    }
}
export const gePostDetail = (id) => {
    return (dispatch) => {
        dispatch(actionGetDetailRequest());
        http.get(`post/${id}/`).then((rs) => {
            dispatch(actionGetDetailSuccess(rs.data));
        }).catch((err) => {
            dispatch(actionGetDetailFailed(err));  
        });
    }
}

export const geListApplications = (id) => {
    return (dispatch) => {
        dispatch(actionGetApplicantsRequest());
        http_auth.post(`apply/list-of-post/`, id).then((rs) => {
            dispatch(actionGetApplicantsSuccess(rs.data));
        }).catch((err) => {
            dispatch(actionGetApplicantsFailed(err));  
        });
    }
}
export const deletePost = (id) => {
    return (dispatch) => {
        http_auth.get(`post/${id}/delete/`).then((rs) => {
            Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
            dispatch(getOwnerPost());
        }).catch((err) => {
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
        });
    }
}

export const actActive = (data) => {
    return async (dispatch) => {
        await http_auth.post('post/change-active/', data).then((rs) => {
            Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
        }).catch((err) => {
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
        })
    }
}
const actionGetPostRequest = () => {
    return {
        type: Type.GETPOST_REQUEST
    }
}
const actionGetPostSuccess = (data) => {
    return {
        type: Type.GETPOST_SUCCESS,
        data: data
    }
}
const actionGetPostFailed = (err) => {
    return {
        type: Type.GETPOST_FAILED,
        data: err
    }
}
const actionGetTopPostRequest = () => {
    return {
        type: Type.GETTOPPOST_REQUEST
    }
}
const actionGetTopPostSuccess = (data) => {
    return {
        type: Type.GETTOPPOST_SUCCESS,
        data: data
    }
}
const actionGetTopPostFailed = (err) => {
    return {
        type: Type.GETTOPPOST_FAILED,
        data: err
    }
}
const actionGetDetailRequest = () => {
    return {
        type: Type.GETDETAIL_REQUEST
    }
}
const actionGetDetailSuccess = (data) => {
    return {
        type: Type.GETDETAIL_SUCCESS,
        data: data
    }
}
const actionGetDetailFailed = (err) => {
    return {
        type: Type.GETDETAIL_FAILED,
        data: err
    }
}
const actionGetOwnerRequest = () => {
    return {
        type: Type.GETOWNER_REQUEST
    }
}
const actionGetOwnerSuccess = (data) => {
    return {
        type: Type.GETOWNER_SUCCESS,
        data: data
    }
}
const actionGetOwnerFailed = (err) => {
    return {
        type: Type.GETOWNER_FAILED,
        data: err
    }
}
const actionSetPage = (data) => {
    return {
        type: Type.PAGE_INFO,
        data: data
    }
}
const actionGetApplicantsRequest = () => {
    return {
        type: Type.GETAPPLICANTS_REQUEST
    }
}
const actionGetApplicantsSuccess = (data) => {
    return {
        type: Type.GETAPPLICANTS_SUCCESS,
        data: data
    }
}
const actionGetApplicantsFailed = (err) => {
    return {
        type: Type.GETAPPLICANTS_FAILED,
        data: err
    }
}
