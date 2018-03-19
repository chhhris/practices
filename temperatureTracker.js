class TemperatureTracker {

  constructor(){
    this.temps = [];
    this.max;
    this.min;
    this.mode;
    this.mean;
    this.lengthTemps = 0;
    this.sum = 0;
  }

  insert(val) {
    this.temps.push(val);
    this.lengthTemps++;
    this.sum += val;
    setMean(val);
    setMode(val);

    if (this.getMax() === undefined || val > this.getMax()) {
      this.max = val;
    }

    if (this.getMax() === undefined || val < this.getMin()) {
      this.min = val;
    }
  }

  getMax() {
    return this.max;
  }

  getMin() {
    return this.min;
  }

  setMean(val) {
    this.mean = this.sum / this.temps.length;
  }

  getMean() {
    return this.mean;
  }

  setMode(val) {

  }

  getMode() {

  }
}


