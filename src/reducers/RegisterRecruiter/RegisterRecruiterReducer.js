import * as Type from './type';
let initialState = {
    loading: true,
    status: false,
    err: null,
}
const RegisterRecruiterReducer = (state = initialState, action) => {
    switch (action.type) {
        case Type.REGISTERRECRUITER_REQUEST: {
            state.loading = true;
            state.status = false;
            state.err = null;
            return {...state}
        }
        case Type.REGISTERRECRUITER_SUCCESS:{
            state.loading = false;
            state.status = true;
            state.err = null;
            return {...state}
        }
        case Type.REGISTERRECRUITER_FAILED:{
            state.loading = false;
            state.status = false;
            state.err = action.data;
            return {...state}
        }
        default:
            return { ...state }
    }

}
export default RegisterRecruiterReducer;