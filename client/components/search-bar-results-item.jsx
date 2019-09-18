import React from "react";


function handleClick(props, recipe) {
  console.log(props);
  props.setView("recipe details", recipe, []);
}

function SearchBarResultsItem(props) {
  return (

    <div className="card mb-0" style={{ maxWidth: "400px" }}>
      <div className="row no-gutters">
        <div className="col-4">
          <div
            className="card-img-top propsImage"
            style={{
              backgroundImage: "url("+props.image+")",
              backgroundSize: "cover",
              backgroundRepeat:"no-repeat",
              height: "100%",
              width: "100%"
            }}
          ></div>
        </div>
        <div className="col-8">
          <div className="card-body">
            <h5
              className="card-title"
              onClick={e => handleClick(props, props.recipe)}
            >
              {props.name}
            </h5>
            <p className="card-text">Time: {props.time} minutes</p>
          </div>
        </div>
      </div>
    </div>
  
  );
}

export default SearchBarResultsItem;