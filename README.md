# Lets Chat — Production-Grade Real-Time Chat Web Application

| Academic & Project Record | Details |
| :--- | :--- |
| **PROJECT TITLE** | Lets Chat — Real-Time Chat Web Application |
| **PROJECT OWNER** | **Shahid Khan (Owner)** |
| **OWNER SAP ID** | **53013250120** |
| **TEAM MEMBER / QA LEAD** | **Namra Ansari** |
| **MEMBER SAP ID** | **53013240015** |
| **SUBJECT / COURSE** | **Software Project Management (SPM)** |
| **ACADEMIC EDITION** | Version 3.0 (Final Multi-User Release) |
| **TARGET PLATFORM** | Multi-Browser Localhost Real-Time Chat System |

---

**Lets Chat** is a polished, production-style, multi-user real-time chat application built with **React 19**, **Vite 7**, **TypeScript 5**, **Tailwind CSS v4**, **Node.js HTTP API**, and embedded **SQLite database persistence** (`node:sqlite`).

Unlike static college demo prototypes, **Lets Chat** features genuine multi-user session onboarding, persistent relational database storage, real-time cross-window messaging **without fake or artificial bot replies**, live debounced typing indicators, real delivery checkmark ticks (`sent` / `read`), image attachments with full-screen lightbox zoom, binary file uploads, and a mobile-responsive UI.

---

## 🏗 System Architecture Diagram

```
 ┌─────────────────────────────────────────────────────────────────────────────┐
 │                         FULL-STACK ARCHITECTURE                             │
 ├─────────────────────────────────────────────────────────────────────────────┤
 │                                                                             │
 │   BROWSER WINDOW A (User 1)           BROWSER WINDOW B (User 2)             │
 │   ┌────────────────────────┐          ┌────────────────────────┐            │
 │   │ React 19 Client SPA    │          │ React 19 Client SPA    │            │
 │   │ Session: Shahid Khan   │          │ Session: Namra Ansari  │            │
 │   │ Owner (53013250120)    │          │ QA Lead (53013240015)  │            │
 │   └───────────┬────────────┘          └───────────┬────────────┘            │
 │               │ HTTP REST &                       │ HTTP REST &             │
 │               │ Persistent SSE                    │ Persistent SSE          │
 │               ▼                                   ▼                         │
 │   ┌───────────────────────────────────────────────────────────┐             │
 │   │               NODE.JS SERVER (Port 8787)                  │             │
 │   │ ┌────────────────────────┐     ┌────────────────────────┐ │             │
 │   │ │ REST API Router        │     │ SSE Broadcast Engine   │ │             │
 │   │ └───────────┬────────────┘     └───────────▲────────────┘ │             │
 │   └─────────────┼──────────────────────────────┼──────────────┘             │
 │                 ▼                              │ Live Broadcast             │
 │   ┌────────────────────────────────────────────┴──────────────┐             │
 │   │               EMBEDDED SQLITE DATABASE                    │             │
 │   │  Tables: users, conversations, members, messages, read    │             │
 │   └───────────────────────────────────────────────────────────┘             │
 │                                                                             │
 └─────────────────────────────────────────────────────────────────────────────┘
```

---

## ⚡ Quick Start & Running Guide

### 1. Pre-Requisites
- **Node.js**: v18.0.0 or newer (v24.4.1 recommended for native `node:sqlite` support)
- **npm**: v9.0.0 or newer

---

### 2. Launching the Application

#### Option A: One-Click Launcher (Recommended for PowerShell / CMD)

In **PowerShell**:
```powershell
.\start-dev.bat
```
*(or `.\start-dev.ps1`)*

In **Command Prompt (CMD)**:
```cmd
start-dev.bat
```

---

#### Option B: Standard npm Command

1. Open your terminal in the project directory:
   ```bat
   cd /d D:\Downloads\Lets Chat WebApp-real-time\artifacts\lets-chat-webapp
   ```
2. Install dependencies:
   ```bat
   npm install
   ```
3. Start the full-stack dev server:
   ```bat
   npm run dev:full
   ```

---

### 3. Accessing the Application

Open your browser at:
👉 **`http://localhost:5173`**

*(The Node HTTP API listens on `http://127.0.0.1:8787` and Vite proxies `/api` requests automatically).*

---

## 🛑 Stopping & Restarting the Server

If you ever need to stop running Node processes and free up ports `8787` & `5173`:

In **PowerShell** / **CMD**:
```cmd
.\stop-dev.bat
```

---

## 💾 Windows D: Drive Environment Configuration

If your Windows `C:` drive has 0.00 GB free disk space (`ENOSPC` error), npm and Node temporary directories must be redirected to `D:` drive. The helper scripts (`start-dev.bat` / `start-dev.ps1`) automatically set these environment variables:

```bat
set TMP=D:\temp
set TEMP=D:\temp
set npm_config_cache=D:\npm-cache
```

---

## 🧪 Testing Real Multi-User Messaging (Step-by-Step)

To verify real multi-user communication between **Shahid Khan (Owner: 53013250120)** and **Namra Ansari (53013240015)**:

1. Open `http://localhost:5173` in **Browser Window A**.
2. Select or enter name **Shahid Khan (Owner)** (`shahid`).
3. Open `http://localhost:5173` in **Browser Window B** (Incognito window or separate browser).
4. Select or enter name **Namra Ansari** (`namra`).
5. In Window A (Shahid Khan Owner), open a conversation with **Namra Ansari** and send `"Hey Namra, are you ready for the SPM project demo?"`.
6. Observe Window B (Namra Ansari) receive the incoming message live via SSE **without any artificial bot delays**.
7. In Window B (Namra Ansari), start typing. Observe Window A show real-time debounced typing indicators: `Namra Ansari is typing...`.
8. When Namra Ansari opens the conversation, observe Shahid Khan's message status tick update from `sent` (single check) to `read` (`#4d9c8b` double checkmark).
9. Upload an image or document attachment. Click the image to view the full-screen lightbox zoom, or click the download link.
10. Refresh both browser windows. Observe that all conversations, messages, and read states persist from `data/chat.db`.

---

## 📂 Codebase & File Directory Map

| Layer / Purpose | File Path |
| :--- | :--- |
| **Main React Entry** | [`src/App.tsx`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/src/App.tsx) |
| **TypeScript Types** | [`src/types/chat.ts`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/src/types/chat.ts) |
| **Realtime Stream Hook** | [`src/hooks/useRealtimeChat.ts`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/src/hooks/useRealtimeChat.ts) |
| **Modular UI Components**| [`src/components/`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/src/components/) |
| **Backend Node Server** | [`server/index.mjs`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/server/index.mjs) |
| **SQLite Database Code** | [`server/database.mjs`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/server/database.mjs) |
| **Process Orchestrator** | [`server/start-full.mjs`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/server/start-full.mjs) |
| **SQLite Database File** | `data/chat.db` |
| **File Storage Uploads** | `data/uploads/` |

---

## 🛠 Build & Typecheck Verification Commands

- **TypeScript Strict Verification**:
  ```bat
  npm run typecheck
  ```
- **Vite Production Asset Build**:
  ```bat
  npm run build
  ```
- **Production Preview Server**:
  ```bat
  npm run serve
  ```

---

## 📑 Academic Software Project Management Documentation Suite

Comprehensive faculty-submission-grade documentation for each project role is available in the [`docs/`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/docs/) folder:

| Role Document | Absolute File Path | Core Focus |
| :--- | :--- | :--- |
| **Designer Documentation** | [`docs/DESIGNER_DOCUMENTATION.md`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/docs/DESIGNER_DOCUMENTATION.md) | UX thesis, cognitive ergonomics, design tokens, Nielsen heuristics, version evolution |
| **Developer Documentation** | [`docs/DEVELOPER_DOCUMENTATION.md`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/docs/DEVELOPER_DOCUMENTATION.md) | Full-stack architecture, SQLite schema, REST API, SSE stream, React 19 structure |
| **Deployer Documentation** | [`docs/DEPLOYER_DOCUMENTATION.md`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/docs/DEPLOYER_DOCUMENTATION.md) | Multi-port configuration, Windows D: drive setup, process orchestration, runbook |
| **Project Manager Documentation**| [`docs/PROJECT_MANAGER_DOCUMENTATION.md`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/docs/PROJECT_MANAGER_DOCUMENTATION.md) | WBS, scope management, risk mitigation matrix, project timeline, governance |
| **Tester Documentation** | [`docs/TESTER_DOCUMENTATION.md`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/docs/TESTER_DOCUMENTATION.md) | QA strategy, test environment, defect log, execution matrix summary |
| **Formal QA Testing Dossier** | [`docs/QA_TESTING_DOSSIER.md`](file:///d:/Downloads/Lets%20Chat%20WebApp-real-time/artifacts/lets-chat-webapp/docs/QA_TESTING_DOSSIER.md) | Formal QA test cases with IDs, preconditions, steps, expected vs actual results |