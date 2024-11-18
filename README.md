# README: Julia Assignments - Math for Intelligent Systems

This repository contains Julia assignments completed as part of the course **Math for Intelligent Systems**. These assignments involve solving mathematical problems and implementing algorithms in Julia, showcasing the utility of Julia in intelligent systems and computational mathematics.

---

## Table of Contents
1. [Introduction](#introduction)
2. [Installing Julia](#installing-julia)
3. [Setting Up the Environment](#setting-up-the-environment)
4. [How to Run the Assignments](#how-to-run-the-assignments)
---

## Introduction
Julia is a high-performance programming language designed for numerical and scientific computing. Its syntax is easy to learn for those familiar with Python, MATLAB, or R, and its speed rivals that of C or Fortran. These assignments uses Julia in solving mathematical problems relevant to Applied Linear Algebra.

---

## Installing Julia

### Step 1: Download Julia
1. Visit the [Julia official website](https://julialang.org/downloads/).
2. Download the latest stable version for your operating system.

### Step 2: Install Julia
1. Run the downloaded installer and follow the installation instructions.
2. Add Julia to your system’s PATH for easier command-line access.

### Step 3: Verify Installation
1. Open a terminal (or Command Prompt).
2. Run the command:
   ```bash
   julia --version
   ```
   You should see the installed version of Julia.

---

## Setting Up the Environment
1. Open Julia's REPL (Read-Eval-Print Loop) by typing `julia` in your terminal followed by `]` to install packages.

2. Install required packages for the assignments:
   ```julia
   add("DSP")
   add("Plots")
   add("WAV")
   add("LinearAlgebra")
   add("Polynomials")
   add("Statistics")
   ```

### Navigating Julia REPL
- Enter Julia REPL by running `julia` in your terminal.
- Exit REPL: Press `Ctrl+D` or `Ctrl+Z`.

---

## How to Run the Assignments
1. Clone the repository:
   ```bash
   git clone git@github.com:KrishnaKodali99/math-for-intelligent-systems.git
   ```
2. Navigate to the cloned directory:
   ```bash
   cd math-intelligent-systems
   ```
3. Start Julia in the project directory:
   ```bash
   julia --project=.
   ```
4. Run a specific assignment:
   ```julia
   include("Homework-1.jl")
   ```
