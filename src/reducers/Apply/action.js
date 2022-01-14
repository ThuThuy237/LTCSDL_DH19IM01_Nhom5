import { http_auth } from "../../api/http_auth";
import {Noti} from "../../Components/Noti";
import { getUserLogin } from '../../reducers/Login/action';

export const actApply = (id) => {
    return async (dispatch) => {
        let data = {
            postId: id,
        }
        await http_auth.post('apply/apply/', data).then((rs) => {
            Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
            dispatch(getUserLogin());
        }).catch((err) => {
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }else{
                Noti("Error", "Apply failed", "error");
            }
        })
    }
}


export const actRating = (data) => {
    return async (dispatch) => {
        await http_auth.post('apply/rating/', data).then((rs) => {
            dispatch(getUserLogin());
            Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
        }).catch((err) => {
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
        })
    }
}
export const actChangeStatus = (data, id) => {
    return async (dispatch) => {
        await http_auth.post(`apply/${id}/manage-status/`, {status:data}).then((rs) => {
            dispatch(getUserLogin());
            Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
        }).catch((err) => {
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
        })
    }
}