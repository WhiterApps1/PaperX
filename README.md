# 📈 High-Performance Paper Trading Platform (Flutter)

A **high-performance, real-time paper trading platform** built with **Flutter** and **Clean Architecture**, designed for financial accuracy, scalability, and ultra-low latency data streaming.

---

## 🧱 Architectural Overview

The project strictly follows **Clean Architecture** principles to ensure:

- Scalability
- Testability
- Clear separation of concerns
- Long-term maintainability

The codebase is **feature-first and modular**, enabling independent evolution of trading, portfolio, and authentication modules.

### Architecture Layers

- **Data Layer**
  - Handles external data sources
  - WebSockets (Streaming)
  - Protobuf (Binary Serialization)
  - Dio (REST APIs)

- **Domain Layer**
  - Pure Dart business logic
  - Entities, Repositories, Use Cases
  - ❌ No Flutter dependencies allowed

- **Presentation Layer**
  - Flutter UI
  - State management using **BLoC + Signals**

---

## 🛠 Technical Stack

- **Language:** Dart 3.x+
- **Networking:**
  - Dio (REST APIs)
  - WebSockets (Real-time streaming)
- **Serialization:** Protocol Buffers (Protobuf)
- **State Management:**
  - **BLoC** – High-level business logic & navigation  
    (Generated using `dev_bloc_cli`)
  - **Signals** – Ultra-fast UI updates for live prices
- **Dependency Injection:** GetIt  
  (`injection_container.dart`)

---

## 🔄 Real-Time Data Protocol (Standard 2026)

To reduce CPU overhead and battery consumption, the application **abandons JSON** in favor of **binary Protobuf streaming**.

### Implementation Strategy

- **Binary Streaming**
  - Persistent WebSocket connection

- **Isolate Decoupling**
  - Incoming binary packets streamed directly into a **background Dart Isolate**

- **Decoding**
  - Protobuf decoding occurs inside the isolate
  - Prevents UI jank and frame drops

- **Signal Propagation**
  - Decoded prices are pushed to the UI using **Signals**
  - Enables surgical widget updates

---

## ⚡ Performance Optimization Strategies

### 🎨 Rendering Efficiency

- **RepaintBoundary**
  - Wrap high-frequency UI elements (charts, order books)

- **Const Constructors**
  - Strict usage of `const` wherever possible

- **Stateless Over Stateful**
  - Prefer `StatelessWidget` + Signals / `BlocBuilder`
  - Avoid `setState()` in complex views

---

### 🧮 Computational Efficiency

- **Heavy Operations**
  - Profit/Loss calculations
  - Technical indicators
  - Executed inside background isolates

- **Memory Management**
  - Strict adherence to DRY (Don’t Repeat Yourself)
  - Reduces code bloat and logic duplication

---

## 📁 Folder Structure

The project follows a **feature-based modular structure**.

lib/
├── core/ # Global utilities
│ ├── constants/ # API endpoints, assets, colors
│ ├── error/ # Failures & Exceptions
│ ├── network/ # Dio, WebSocket, connection checker
│
├── features/ # Independent modules
│ ├── trade/ # Trading & charting
│ │ ├── data/
│ │ ├── domain/
│ │ └── presentation/
│ │
│ └── portfolio/ # Portfolio tracking
│
├── main.dart # Application entry point
└── injection_container.dart # GetIt service locator



---

## 👨‍💻 Developer Guidelines

### BLoC Generation

- **Mandatory:** Use `dev_bloc_cli`
- Ensures consistent event-state patterns
- Prevents boilerplate errors

---

### Componentization

- ❌ No “God Widgets”
- Every UI element must be isolated:
  - `PriceTicker`
  - `OrderButton`
  - `AssetCard`
- Stored inside the feature’s `widgets/` directory

---

### Network Calls

- **Dio**
  - Login
  - History
  - One-time API calls

- **WebSockets + Protobuf**
  - All real-time/live market data

- **Connection Handling**
  - Global `ConnectionChecker` in `core/network`
  - Graceful degradation during signal loss

---

## 📊 Key Performance Metrics (KPIs)

| Metric        | Target |
|---------------|--------|
| Frame Rate    | 60 / 120 FPS |
| CPU Usage     | ↓ 40% vs JSON-based apps |
| Data Usage    | ↓ ~60% payload size |
| UI Jank       | Zero during volatility |

---

## 🧪 Quality Assurance & Testing Strategy (2026 Standard)

In financial systems, **correctness > features**.  
This platform adopts **precision-focused testing** instead of brute-force testing.

---

### 🔬 Unit Testing (Core Layer)

Mandatory for **Domain** and **Data** layers.

- **Logic Isolation**
  - Use `mocktail` for repositories

- **Protobuf Validation**
  - Ensure binary packets decode correctly

- **Formula Verification**
  - Example:
    ```
    PnL = (CurrentPrice - EntryPrice) × Quantity
    ```

- **Isolate Testing**
  - Validate isolate communication
  - Ensure no memory leaks

---

### 🔄 BLoC & Signal Testing

- **BLoC Testing**
  - Use `bloc_test`
  - Validate state transitions:
    ```
    PlaceOrder → Loading → Success
    ```

- **Signal Reactivity**
  - Ensure price updates do not rebuild entire UI
  - Surgical widget updates only

---

### 🌐 Mocking & Network Simulation

- **Mocking Dio**
  - Simulate 4xx / 5xx responses
  - Validate error handling

- **Stream Simulation**
  - Use `StreamController`
  - Push mock Protobuf data
  - Simulate 50+ updates/sec bursts

---

### 🚀 Performance Goldens & Benchmarking

- **Frame Timing**
  - Ensure < 8ms build time (120Hz displays)

- **Memory Leak Detection**
  - Verify WebSocket isolates are disposed
  - Ensure signals are cleaned up on view exit

---

## 📋 Implementation Requirements

| Layer          | Tool          | Requirement |
|----------------|---------------|------------|
| Domain         | flutter_test  | 100% Use Case coverage |
| Data           | mocktail      | Protobuf stream mocking |
| Presentation   | bloc_test     | State transition validation |
| Reactivity     | signals       | Signal propagation latency |

---

## ✅ Summary

This platform is engineered for:

- **Ultra-low latency**
- **High-frequency financial data**
- **Battery-efficient streaming**
- **Enterprise-grade reliability**

Built for **2026-level performance expectations**.

---

