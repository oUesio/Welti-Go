import React from 'react';
import Cookies from 'js-cookie';

const CSRFToken = () => {
    return (
        <input id="csrfmiddlewaretoken" name="csrfmiddlewaretoken" type="hidden" value={Cookies.get('csrftoken')} />
    );
};
export default CSRFToken;
