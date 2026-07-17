---

## System Overview

<p align="center">
  <img src="radar_SignalModel.png" alt="Single-RF-Chain Beam-Sweeping Radar Architecture and Signal Model" width="900">
</p>

<p align="center">
<b>Figure 1.</b> Single-RF-chain beam-sweeping radar architecture and corresponding signal model. Sequential analog receive beams replace the conventional array steering vector with the beam-steering response, enabling joint angle-Doppler estimation.
</p>

The proposed radar employs a **single RF chain** connected to an antenna array through programmable phase shifters. Instead of simultaneously sampling all antenna elements, the receiver sequentially steers analog beams toward different directions. For each receive beam, a burst of pulses is collected before switching to the next beam, producing a beam–pulse measurement matrix for signal processing.


The beam-steering response explicitly models the gain of the analog beamformer in each steering direction. Joint angle-Doppler estimation is then performed using a matched filter that coherently combines all beam-pulse measurements while accounting for the sequential beam acquisition times.

---

## Example Results

### Joint Angle–Doppler Surface

<p align="center">
  <img src="images/angle_doppler_surface.png" width="750">
</p>

### Joint Angle–Velocity Map

<p align="center">
  <img src="images/angle_velocity_map.png" width="750">
</p>
