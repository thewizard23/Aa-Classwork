import React from 'react';

class Tabs extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            selected: 0
        }
    }

    render () {
        return ( 
            <ul> 
                {this.props.tabs.map( tab => {
                    return (
                        <li>
                            <h1>{tab.title}</h1>
                            <body>
                                {tab.content}
                            </body>
                        </li>
                    )
                })}
            </ul> 
        )
    }
}

export default Tabs; 