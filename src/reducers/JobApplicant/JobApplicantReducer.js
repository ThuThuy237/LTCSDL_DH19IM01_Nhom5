import * as Type from './type';
let initialState = {
    loading: true,
    listApply: null,
    err: null,
}
const JobApplicantReducer = (state = initialState, action) => {
    switch (action.type) {
        case Type.GETLISTAPPLY_REQUEST: {
            state.loading = true;
            state.listApply = null;
            state.err = null;
            return {...state}
        }
        case Type.GETLISTAPPLY_SUCCESS:{
            state.loading = false;
            state.listApply = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETLISTAPPLY_FAILED:{
            state.loading = false;
            state.listApply = null;
            state.err = action.data;
            return {...state}
        }
        default:
            return { ...state }
    }

}
export default JobApplicantReducer;