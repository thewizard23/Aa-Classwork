import React from 'react'; 
import Clock from './clock';
import Tabs from './tabs';  

const tabs = [
    {title: "cats1", content:"whatever to show"}, 
    {title: "cats2", content: "another thing to show"}, 
    {title: "cats3", content: "not cats again"}
]

const Root = () => {
    return (
        <div>
            <Clock/> 
            <Tabs tabs={tabs}/> 
        </div>
    )
}

export default Root; 