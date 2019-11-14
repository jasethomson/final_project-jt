import React from 'react';
import Menu from './menu';

function Header(props) {
  return (
    <div>
      <div className="row justify-content-end mb-1 headerContents">
        <div className="col-11 headerTextMenu textFont textSize flex-fill mt-2 align-self-center text-capitalize">{ props.text }</div>
        <Menu setView={ props.setView }/>
      </div>
    </div>
  );
}

export default Header;
