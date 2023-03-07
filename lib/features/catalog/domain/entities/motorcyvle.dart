class Motorcycle {
  String? make;
  String? model;
  String? year;
  String? type;
  String? displacement;
  String? engine;
  String? power;
  String? torque;
  String? compression;
  String? boreStroke;
  String? valvesPerCylinder;
  String? fuelSystem;
  String? fuelControl;
  String? ignition;
  String? lubrication;
  String? cooling;
  String? gearbox;
  String? transmission;
  String? clutch;
  String? frame;
  String? frontSuspension;
  String? frontWheelTravel;
  String? rearSuspension;
  String? rearWheelTravel;
  String? frontTire;
  String? rearTire;
  String? frontBrakes;
  String? rearBrakes;
  String? totalWeight;
  String? seatHeight;
  String? totalHeight;
  String? totalLength;
  String? totalWidth;
  String? groundClearance;
  String? wheelbase;
  String? fuelCapacity;
  String? starter;

  Motorcycle(
      {this.make,
      this.model,
      this.year,
      this.type,
      this.displacement,
      this.engine,
      this.power,
      this.torque,
      this.compression,
      this.boreStroke,
      this.valvesPerCylinder,
      this.fuelSystem,
      this.fuelControl,
      this.ignition,
      this.lubrication,
      this.cooling,
      this.gearbox,
      this.transmission,
      this.clutch,
      this.frame,
      this.frontSuspension,
      this.frontWheelTravel,
      this.rearSuspension,
      this.rearWheelTravel,
      this.frontTire,
      this.rearTire,
      this.frontBrakes,
      this.rearBrakes,
      this.totalWeight,
      this.seatHeight,
      this.totalHeight,
      this.totalLength,
      this.totalWidth,
      this.groundClearance,
      this.wheelbase,
      this.fuelCapacity,
      this.starter});

  Motorcycle.fromJson(Map<String, dynamic> json) {
    make = json['make'];
    model = json['model'];
    year = json['year'];
    type = json['type'];
    displacement = json['displacement'];
    engine = json['engine'];
    power = json['power'];
    torque = json['torque'];
    compression = json['compression'];
    boreStroke = json['bore_stroke'];
    valvesPerCylinder = json['valves_per_cylinder'];
    fuelSystem = json['fuel_system'];
    fuelControl = json['fuel_control'];
    ignition = json['ignition'];
    lubrication = json['lubrication'];
    cooling = json['cooling'];
    gearbox = json['gearbox'];
    transmission = json['transmission'];
    clutch = json['clutch'];
    frame = json['frame'];
    frontSuspension = json['front_suspension'];
    frontWheelTravel = json['front_wheel_travel'];
    rearSuspension = json['rear_suspension'];
    rearWheelTravel = json['rear_wheel_travel'];
    frontTire = json['front_tire'];
    rearTire = json['rear_tire'];
    frontBrakes = json['front_brakes'];
    rearBrakes = json['rear_brakes'];
    totalWeight = json['total_weight'];
    seatHeight = json['seat_height'];
    totalHeight = json['total_height'];
    totalLength = json['total_length'];
    totalWidth = json['total_width'];
    groundClearance = json['ground_clearance'];
    wheelbase = json['wheelbase'];
    fuelCapacity = json['fuel_capacity'];
    starter = json['starter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['make'] = this.make;
    data['model'] = this.model;
    data['year'] = this.year;
    data['type'] = this.type;
    data['displacement'] = this.displacement;
    data['engine'] = this.engine;
    data['power'] = this.power;
    data['torque'] = this.torque;
    data['compression'] = this.compression;
    data['bore_stroke'] = this.boreStroke;
    data['valves_per_cylinder'] = this.valvesPerCylinder;
    data['fuel_system'] = this.fuelSystem;
    data['fuel_control'] = this.fuelControl;
    data['ignition'] = this.ignition;
    data['lubrication'] = this.lubrication;
    data['cooling'] = this.cooling;
    data['gearbox'] = this.gearbox;
    data['transmission'] = this.transmission;
    data['clutch'] = this.clutch;
    data['frame'] = this.frame;
    data['front_suspension'] = this.frontSuspension;
    data['front_wheel_travel'] = this.frontWheelTravel;
    data['rear_suspension'] = this.rearSuspension;
    data['rear_wheel_travel'] = this.rearWheelTravel;
    data['front_tire'] = this.frontTire;
    data['rear_tire'] = this.rearTire;
    data['front_brakes'] = this.frontBrakes;
    data['rear_brakes'] = this.rearBrakes;
    data['total_weight'] = this.totalWeight;
    data['seat_height'] = this.seatHeight;
    data['total_height'] = this.totalHeight;
    data['total_length'] = this.totalLength;
    data['total_width'] = this.totalWidth;
    data['ground_clearance'] = this.groundClearance;
    data['wheelbase'] = this.wheelbase;
    data['fuel_capacity'] = this.fuelCapacity;
    data['starter'] = this.starter;
    return data;
  }
}
