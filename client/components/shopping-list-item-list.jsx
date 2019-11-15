import React from 'react';
import ShoppingListItem from './shopping-list-item';

function ShoppingListItemList(props) {
  return (
    <div className="shoppingListContents">
      {props.allItems.map(item => {
        return (
          <ShoppingListItem
            key={item.id}
            oneItem={item}
            deleteItem={props.deleteItem}
            toggleChecked={props.toggleChecked}/>
        );
      })}
    </div>
  );
}

export default ShoppingListItemList;
