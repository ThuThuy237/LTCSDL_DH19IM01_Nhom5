import { notification } from 'antd';

const Noti = (mess, description, type)=> {
    return notification.open({
        message: mess, 
        description:
        description,
        placement: 'topRight',
        type: type,
        style: {
            width: 400,
        },
    });
}


export {Noti};