


import React from 'react'; 

class Clock extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            time: new Date() 

        }

        this.tick = this.tick.bind(this); 
    }

    tick() {
        this.setState({ time: new Date() });
    }

    componentDidMount() {
        this.interval_id = setInterval(this.tick, 1000); 
    }

    componentWillUnount() {
        clearInterval(this.interval_id);
    }
    
    render (){
        return (
            <div className="clock-widget">
                <h1>Clock</h1>  
                <div className="clock-body">
                    <div className="time-title">Time:</div>
                    <div className="time-display">
                        <span>{this.state.time.getHours()}:</span>
                        <span>{this.state.time.getMinutes()}:</span>
                        <span>{this.state.time.getSeconds()} PDT</span>
                    </div>
                </div>
            </div>
        );
    }
}

export default Clock; 