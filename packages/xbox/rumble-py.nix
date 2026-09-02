{
  writeShellApplication,
}:

writeShellApplication {
  name = "rumble-py";

  text = ''
    import sys, time
    from evdev import InputDevice, ff, ecodes

    dev = InputDevice(sys.argv[1])
    mode = sys.argv[2] if len(sys.argv) > 2 else "on"

    # on: single low-freq rumble; off: double short high-freq buzz
    if mode == "off":
        strong, weak, length, delay, count = 0x3000, 0xFFFF, 90, 80, 2
    else:
        strong, weak, length, delay, count = 0xC000, 0x6000, 250, 0, 1

    rumble = ff.Rumble(strong_magnitude=strong, weak_magnitude=weak)
    eff = ff.Effect(
        ecodes.FF_RUMBLE, -1, 0, ff.Trigger(0, 0), ff.Replay(length, delay),
        ff.EffectType(ff_rumble_effect=rumble),
    )

    eid = dev.upload_effect(eff)
    dev.write(ecodes.EV_FF, eid, count)
    time.sleep((length + delay) * count / 1000 + 0.05)
    dev.erase_effect(eid)
  '';

  derivationArgs = {
    allowSubstitutes = false;
    preferLocalBuild = true;
  };
}
