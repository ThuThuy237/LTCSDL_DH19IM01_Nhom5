import * as Type from './type';
let initialState = {
    loading: true,
    apply: null,
    rate: "no",
    err: null,
}
const ApplyReducer = (state = initialState, action) => {
    switch (action.type) {
        case Type.APPLY_REQUEST: {
            state.loading = true;
            state.apply = null;
            state.err = null;
            return {...state}
        }
        case Type.APPLY_SUCCESS:{
            state.loading = false;
            state.apply = action.data;
            state.err = null;
            return {...state}
        }
        case Type.APPLY_FAILED:{
            state.loading = false;
            state.apply = null;
            state.err = action.data;
            return {...state}
        }
        case Type.RATING_REQUEST: {
            state.loading = true;
            state.rate = null;
            state.err = null;
            return {...state}
        }
        case Type.RATING_SUCCESS:{
            state.loading = false;
            state.rate = action.data;
            state.err = null;
            return {...state}
        }
        case Type.RATING_FAILED:{
            state.loading = false;
            state.rate = null;
            state.err = action.data;
            return {...state}
        }
        default:
            return { ...state }
    }

}
export default ApplyReducer;