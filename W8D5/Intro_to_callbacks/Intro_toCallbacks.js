class Clock {
  constructor() {
      let date = new Date();
      //Date.getHours();
      this.minutes = date.getMinutes();
      this.hours = date.getHours();
      this.seconds = date.getSeconds();
      this.printTime();
      console.log(this);
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
        // setInterval(this._tick, 1000);

      setInterval(this._tick.bind(this), 1000);

  }
    
  printTime() {
    let seconds = this.seconds.toString();
    let minutes = this.minutes.toString();
    let hours = this.hours.toString();

    // Format the time in HH:MM:SS
    // Use console.log to print it.
      console.log(hours + ":" + minutes + ":" + seconds)
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds += 1; 
    if (this.seconds === 60) {
        this.seconds = 0; 
        this.minutes += 1; 
    }
    
    console.log(this)
    this.printTime()
  }
}

// const clock = new Clock();