import * as Type from './type';
let initialState = {
    loading: true,
    recruiter: null,
    listRecruiter: null,
    listReview: null,
    err: null,
}
const RecruiterReducer = (state = initialState, action) => {
    switch (action.type) {
        case Type.GETRECRUITER_REQUEST: {
            state.loading = true;
            state.recruiter = null;
            state.err = null;
            return {...state}
        }
        case Type.GETRECRUITER_SUCCESS:{
            state.loading = false;
            state.recruiter = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETRECRUITER_FAILED:{
            state.loading = false;
            state.recruiter = null;
            state.err = action.data;
            return {...state}
        }
        case Type.GETLISTRECRUITER_REQUEST: {
            state.loading = true;
            state.listRecruiter = null;
            state.err = null;
            return {...state}
        }
        case Type.GETLISTRECRUITER_SUCCESS:{
            state.loading = false;
            state.listRecruiter = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETLISTRECRUITER_FAILED:{
            state.loading = false;
            state.listRecruiter = null;
            state.err = action.data;
            return {...state}
        }case Type.GETLISTREVIEW_REQUEST: {
            state.loading = true;
            state.listReview = null;
            state.err = null;
            return {...state}
        }
        case Type.GETLISTREVIEW_SUCCESS:{
            state.loading = false;
            state.listReview = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETLISTREVIEW_FAILED:{
            state.loading = false;
            state.listReview = null;
            state.err = action.data;
            return {...state}
        }
        default:
            return { ...state }
    }

}
export default RecruiterReducer;