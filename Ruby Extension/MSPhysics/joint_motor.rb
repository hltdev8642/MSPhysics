module MSPhysics

  # @since 1.0.0
  class Motor < Joint

    DEFAULT_ACCEL = 40.0
    DEFAULT_DAMP = 10.0
    DEFAULT_FREE_ROTATE_ENABLED = false
    DEFAULT_CONTROLLER = 1.0

    # Create a motor joint.
    # @param [MSPhysics::World] world
    # @param [MSPhysics::Body, nil] parent
    # @param [Geom::Transformation, Array<Numeric>] pin_tra Pin transformation.
    #   Of the given matrix, matrix origin should represent pin origin, and
    #   matrix Z-AXIS should represent pin up.
    def initialize(world, parent, pin_tra)
      super(world, parent, pin_tra, 6)
      MSPhysics::Newton::Motor.create(@address)
      MSPhysics::Newton::Motor.set_accel(@address, DEFAULT_ACCEL.degrees)
      MSPhysics::Newton::Motor.set_damp(@address, DEFAULT_DAMP)
      MSPhysics::Newton::Motor.enable_free_rotate(@address, DEFAULT_FREE_ROTATE_ENABLED)
      MSPhysics::Newton::Motor.set_controller(@address, DEFAULT_CONTROLLER)
    end

    # Get rotational acceleration in radians per second per second.
    # @note The actual acceleration is <tt>accel * controller</tt>.
    # @note The maximum angular rate in radians per second is
    #   <tt>accel * controller / damp</tt>.
    # @return [Numeric]
    def accel
      MSPhysics::Newton::Motor.get_accel(@address)
    end

    # Set rotational acceleration in radians per second per second.
    # @note The actual acceleration is <tt>accel * controller</tt>.
    # @note The maximum angular rate in radians per second is
    #   <tt>accel * controller / damp</tt>.
    # @param [Numeric] value
    def accel=(value)
      MSPhysics::Newton::Motor.set_accel(@address, value)
    end

    # Get rotational damper. Higher damper makes rotation slower.
    # @note The maximum angular rate in radians per second is
    #   <tt>accel * controller / damp</tt>.
    # @return [Numeric]
    def damp
      MSPhysics::Newton::Motor.get_damp(@address)
    end

    # Set rotational damper. Higher damper makes rotation slower.
    # @note The maximum angular rate in radians per second is
    #   <tt>accel * controller / damp</tt>.
    # @param [Numeric] value A value greater than or equal to zero.
    def damp=(value)
      MSPhysics::Newton::Motor.set_damp(@address, value)
    end

    # Determine whether free rotate is enabled. Free rotate allows the motor to
    # spin freely when accel is zero.
    # @return [Boolean]
    def free_rotate_enabled?
      MSPhysics::Newton::Motor.is_free_rotate_enabled?(@address)
    end

    # Enable/Disable free rotate. Free rotate allows the motor to spin freely
    # when accel is zero.
    # @param [Boolean] state
    def free_rotate_enabled=(state)
      MSPhysics::Newton::Motor.enable_free_rotate(@address, state)
    end

    # Get current angle in radians.
    # @return [Numeric]
    def cur_angle
      MSPhysics::Newton::Motor.get_cur_angle(@address)
    end

    # Get current omega in radians per second.
    # @return [Numeric]
    def cur_omega
      MSPhysics::Newton::Motor.get_cur_omega(@address)
    end

    # Get current acceleration in radians per second per second.
    # @return [Numeric]
    def cur_acceleration
      MSPhysics::Newton::Motor.get_cur_acceleration(@address)
    end

    # Get motor controller, magnitude and direction of the desired acceleration.
    # By default, controller value is 1.
    # @note The actual acceleration is <tt>accel * controller</tt>.
    # @note The maximum angular rate in radians per second is
    #   <tt>accel * controller / damp</tt>.
    # @return [Numeric]
    def controller
      MSPhysics::Newton::Motor.get_controller(@address)
    end

    # Set motor controller, magnitude and direction of the desired acceleration.
    # By default, controller value is 1.
    # @note The actual acceleration is <tt>accel * controller</tt>.
    # @note The maximum angular rate in radians per second is
    #   <tt>accel * controller / damp</tt>.
    # @param [Numeric] value
    def controller=(value)
      MSPhysics::Newton::Motor.set_controller(@address, value)
    end

  end # class Motor < Joint
end # module MSPhysics
