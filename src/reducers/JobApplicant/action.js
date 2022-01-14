import { http_auth } from "../../api/http_auth";
import * as Type from './type';
import {Noti} from "../../Components/Noti";
export const actGetListApply = () => {
    return async (dispatch) => {
        dispatch(actionGetListApplyRequest());
        await http_auth.get('apply/get-by-applicant/',).then((rs) => {
            dispatch(actionGetListApplySuccess(rs.data));
        }).catch((err) => {
            dispatch(actionGetListApplyFailed({'Error': 'Get failed!'}));
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
        })
    }
}

const actionGetListApplyRequest = () => {
    return {
        type: Type.GETLISTAPPLY_REQUEST
    }
}
const actionGetListApplySuccess = (data) => {
    return {
        type: Type.GETLISTAPPLY_SUCCESS,
        data: data
    }
}
const actionGetListApplyFailed = (err) => {
    return {
        type: Type.GETLISTAPPLY_FAILED,
        data: err
    }
}