import { http } from "../../api/http";
import * as Type from './type';

export const actionRegisterRecruiter = (data) => {
    return async (dispatch) => {
        dispatch(actionRegisterRecruiterRequest());
        await http.post('employer/', data).then((rs) => {
            actionRegisterRecruiterSuccess();
        }).catch((err) => {
            actionRegisterRecruiterFailed(err);
        })
    }
}

const actionRegisterRecruiterRequest = () => {
    return {
        type: Type.REGISTERRECRUITER_REQUEST
    }
}
const actionRegisterRecruiterSuccess = () => {
    return {
        type: Type.REGISTERRECRUITER_SUCCESS
    }
}
const actionRegisterRecruiterFailed = (err) => {
    return {
        type: Type.REGISTERRECRUITER_FAILED,
        data: err
    }
}