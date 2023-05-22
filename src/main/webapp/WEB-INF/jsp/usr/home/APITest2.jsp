<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API Test2" />

<!--
  Copyright 2021 Google LLC

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>길찾기</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <style>
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }

      .commutes {
        align-content: stretch;
        color: #202124;
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
        font-family: Arial, sans-serif;
        height: 100%;
        min-height: 256px;
        min-width: 360px;
        overflow: auto;
        width: 100%;
      }

      .commutes-info {
        flex: 0 0 110px;
        max-width: 100%;
        overflow: hidden;
      }

      .commutes-initial-state {
        border-radius: 8px;
        border: 1px solid #dadce0;
        display: flex;
        height: 98px;
        margin-top: 8px;
        padding: 0 16px;
      }

      .commutes-initial-state svg {
        align-self: center;
      }

      .commutes-initial-state .description {
        align-self: center;
        flex-grow: 1;
        padding: 0 16px;
      }

      .commutes-initial-state .description .heading {
        font: 22px/28px Arial, sans-serif;
        margin: 0;
      }

      .commutes-initial-state .description p {
        color: #5f6368;
        font: 13px/20px Arial, sans-serif;
        margin: 0;
      }

      .commutes-initial-state .add-button {
        align-self: center;
        background-color: #4285f4;
        border-color: #4285f4;
        border-radius: 4px;
        border-style: solid;
        color: #fff;
        cursor: pointer;
        display: inline-flex;
        fill: #fff;
        padding: 8px 16px 8px 8px;
        white-space: nowrap;
      }

      .commutes-initial-state .add-button .label {
        font: normal 600 15px/24px Arial, sans-serif;
        padding-left: 8px;
      }

      @media (max-width: 535px) {
        .commutes-initial-state svg {
          display: none;
        }

        .commutes-initial-state .description {
          padding-left: 0;
        }

        .commutes-initial-state .description .heading {
          font-weight: bold;
          font-size: 15px;
          line-height: 24px;
        }
      }

      .commutes-destinations {
        display: none;
        position: relative;
        width: 100%;
      }

      .commutes-destinations:hover .visible {
        display: block;
      }

      .commutes-destinations .destinations-container {
        display: flex;
        overflow-x: auto;
        padding: 8px 8px 4px 8px;
        white-space: nowrap;
        width: 100%;
      }

      .commutes-destinations .destinations-container::-webkit-scrollbar {
        display: none;
      }

      .commutes-destinations .destinations-container::-webkit-scrollbar-thumb {
        background-color: #dadce0;
        width: 4px;
      }

      .commutes-destinations .destination-list {
        display: flex;
        flex-grow: 1;
      }

      .commutes-destinations .right-control,
      .commutes-destinations .left-control {
        background-color: #fff;
        border-radius: 40px;
        border-style: none;
        bottom: 35px;
        box-shadow: 0 2px 3px 0 rgb(60 64 67 / 30%), 0 6px 10px 4px rgb(60 64 67 / 15%);
        cursor: pointer;
        fill: #616161;
        height: 40px;
        padding: 8px;
        position: absolute;
        width: 40px;
        z-index: 100;
      }

      .commutes-destinations .right-control:hover,
      .commutes-destinations .left-control:hover {
        background-color: #f1f3f4;
      }

      .commutes-destinations .left-control {
        left: 16px;
      }

      .commutes-destinations .right-control {
        right: 16px;
      }

      .commutes-destinations .add-button {
        align-items: center;
        background-color: #e8f0fe;
        border-radius: 8px;
        border-color: #e8f0fe;
        border-style: solid;
        color: #1967d2;
        cursor: pointer;
        display: flex;
        fill: #1967d2;
        flex-direction: column;
        flex-grow: 1;
        font-weight: bold;
        gap: 4px;
        justify-content: center;
        min-width: 156px;
        padding: 20px 16px;
      }

      .commutes-destinations .add-button:hover {
        background-color: #d2e3fc;
        border-color: #d2e3fc;
        color: #185abc;
        fill: #185abc;
      }

      .commutes-destinations .destination-container {
        cursor: pointer;
        display: flex;
        flex: 1 1 0;
        position: relative;
      }

      .commutes-destinations .destination {
        border-radius: 4px;
        box-shadow: 0 1px 2px 0 rgba(60, 64, 67, 0.3), 0 1px 3px 1px rgba(60, 64, 67, 0.15);
        color: #5f6368;
        fill: #5f6368;
        height: 72px;
        justify-content: space-between;
        margin-right: 8px;
        min-width: 256px;
        overflow: hidden;
        padding: 12px;
        position: relative;
        width: 100%;
      }

      .commutes-destinations .active:after {
        background-color: #4285f4;
        content: '';
        display: block;
        height: 4px;
        left: 0;
        position: absolute;
        top: 0;
        width: 100%;
      }

      .commutes-destinations .active + .destination-controls .directions-button {
        fill: #4285f4;
      }

      .commutes-destinations .active + .destination-controls .edit-button {
        opacity: 1;
      }

      .commutes-destinations .active .metadata .location-marker {
        background-color: #fce8e6;
        color: #d93025;
      }

      .commutes-destinations .destination-container:hover,
      .commutes-destinations .destination-container:focus-within
      {
        background-color: #f8f9fa;
      }

      .commutes-destinations .destination-container:hover .edit-button,
      .commutes-destinations .destination-container:focus-within .edit-button
      {
        opacity: 1;
      }

      .commutes-destinations .destination .destination-content {
        font-size: 12px;
        line-height: 20px;
        overflow: hidden;
      }

      .commutes-destinations .destination .metadata {
        align-items: center;
        display: flex;
        margin-bottom: 4px;
        gap: 4px;
      }

      .commutes-destinations .destination-container svg {
        height: 18px;
        width: 18px;
      }

      .commutes-destinations .destination .location-marker {
        background-color: #f1f3f4;
        border-radius: 8px;
        color: #616161;
        display: inline-block;
        font-size: 14px;
        font-weight: bold;
        line-height: 16px;
        text-align: center;
        width: 16px;
      }

      .commutes-destinations .destination .address {
        margin-bottom: 4px;
        max-width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }

      .commutes-destinations .destination .address abbr {
        text-decoration: none;
      }

      .commutes-destinations .destination .destination-eta {
        color: #202124;
        font-weight: bold;
        font-size: 22px;
        line-height: 28px;
      }

      .commutes-destinations .destination-container .destination-controls {
        align-items: flex-end;
        display: flex;
        flex-direction: column;
        min-width: 70px;
        position: absolute;
        right: 20px;
        text-align: right;
        top: 12px;
        white-space: nowrap;
      }

      .commutes-destinations .destination-container .directions-button {
        align-items: center;
        background-color: #fff;
        border-radius: 32px;
        border: 1px solid #dadce0;
        cursor: pointer;
        display: flex;
        fill: #5f6368;
        height: 32px;
        justify-content: center;
        margin: 0;
        width: 34px;
      }

      .commutes-destinations .destination-container .directions-button:hover {
        background-color: #e8f0fe;
        fill: #4285f4;
      }

      .commutes-destinations .destination-container .edit-button {
        background-color: #fff;
        border-radius: 20px;
        border: 1px solid #dadce0;
        opacity: 0;
        font-size: 14px;
        font-weight: bold;
        line-height: 22px;
        margin: 8px 0 0 0;
        padding: 3px 12px 3px 5px;
        fill: #616161;
        color: #616161;
        cursor: pointer;
      }

      .commutes-destinations .destination-container .edit-button svg {
        display: inline-block;
        font-size: 20px;
        line-height: 20px;
        width: 20px;
        vertical-align: middle;
      }

      .commutes-destinations .destination-container .edit-button:hover {
        background-color: #f1f3f4;
      }

      .commutes-map {
        flex: 1;
        overflow: hidden;
        position: relative;
        width: 100%;
      }

      .commutes-map .map-view {
        background-color: rgb(229, 227, 223);
        height: 100%;
        left: 0;
        position: absolute;
        top: 0;
        width: 100%;
      }

      .commutes-modal-container {
        align-items: center;
        background-color: rgba(0, 0, 0, 0.4);
        display: none;
        height: 100%;
        justify-content: center;
        left: 0;
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 1000;
      }

      .commutes-modal {
        background: #fff;
        border-radius: 4px;
        box-shadow: 0 2px 4px -1px rgba(0, 0, 0, 0.2), 0 4px 5px rgba(0, 0, 0, 0.14), 0 1px 10px rgba(0, 0, 0, 0.12);
        height: 256px;
        position: absolute;
        width: 360px;
      }

      .commutes-modal .content {
        padding: 24px 24px 8px;
        display: flex;
        flex-direction: column;
        gap: 16px;
      }
      .commutes-modal .heading {
        font: 24px/32px Arial, sans-serif;
        margin: 0;
      }

      .commutes-modal input {
        font: 16px/24px Arial, sans-serif;
        padding: 10px;
        box-sizing: border-box;
        width: 100%;
      }

      .commutes-modal .error {
        background-color: #fce4e4;
        border: 1px solid #c03;
      }

      .commutes-modal .error-message {
        color: #c03;
        display: inline-block;
        font: 12px/14px Arial, sans-serif;
        margin: 0 0 5px;
      }

      .commutes-modal .travel-modes {
        display: flex;
        flex-direction: row;
        height: 40px;
        margin-bottom: 12px;
        padding: 0;
        width: 100%;
      }

      .commutes-modal .travel-modes [type=radio] {
        height: 0;
        opacity: 0;
        position: absolute;
        width: 0;
      }

      .commutes-modal .travel-modes label {
        align-items: center;
        border: solid #dadce0;
        border-width: 1px 0.031em;
        cursor: pointer;
        display: inline-flex;
        fill: #5f6368;
        flex: 1;
        justify-content: center;
        padding: 6px;
        position: relative;
        transition: background 0.5s, fill 0.5s;
      }

      .commutes-modal .travel-modes label:hover {
        background-color: #f1f3f4;
      }

      .commutes-modal .travel-modes svg {
        height: 24px;
        width: 24px;
      }

      .commutes-modal .travel-modes .left-label {
        border-left-width: 1px;
        border-radius: 4px 0 0 4px;
      }

      .commutes-modal .travel-modes .right-label {
        border-radius: 0 4px 4px 0;
        border-right-width: 1px;
      }

      .commutes-modal .travel-modes input[type=radio]:checked+label {
        background: #e8f0fe;
        fill: #1967d2;
      }

      .commutes-modal .travel-modes input[type=radio]:focus-visible+label {
        outline: 2px solid Highlight;
        outline: 2px solid -webkit-focus-ring-color;
        outline-offset: -2px;
      }

      .commutes-modal .modal-action-bar {
        display: flex;
        justify-content: flex-end;
      }

      .commutes-modal .modal-action-bar button {
        background: #ffff;
        border: none;
        cursor: pointer;
        font-size: 14px;
        font-weight: bold;
        line-height: 32px;
      }

      .commutes-modal .modal-action-bar .delete-destination-button {
        color: #c5221f;
        left: 18px;
        position: absolute;
      }

      .commutes-modal .modal-action-bar .cancel-button {
        color: #0000008a;
      }

      .commutes-modal .modal-action-bar .add-destination-button,
      .commutes-modal .modal-action-bar .edit-destination-button {
        color: #1a73e8;
      }

      .hide {
        display: none;
      }
    </style>
  </head>
  <body>
    <!-- Defined commutes SVGs -->
    <svg class="hide">
      <defs>
        <symbol id="commutes-initial-icon">
          <path d="M41 20H18.6c-9.5 0-10.8 13.5 0 13.5h14.5C41 33.5 41 45 33 45H17.7" stroke="#D2E3FC" stroke-width="5"></path>
          <path d="M41 22c.2 0 .4 0 .6-.2l.4-.5c.3-1 .7-1.7 1.1-2.5l2-3c.8-1 1.5-2 2-3 .6-1 .9-2.3.9-3.8 0-2-.7-3.6-2-5-1.4-1.3-3-2-5-2s-3.6.7-5 2c-1.3 1.4-2 3-2 5 0 1.4.3 2.6.8 3.6s1.2 2 2 3.2c.9 1 1.6 2 2 2.8.5.9 1 1.7 1.2 2.7l.4.5.6.2Zm0-10.5c-.7 0-1.3-.2-1.8-.7-.5-.5-.7-1.1-.7-1.8s.2-1.3.7-1.8c.5-.5 1.1-.7 1.8-.7s1.3.2 1.8.7c.5.5.7 1.1.7 1.8s-.2 1.3-.7 1.8c-.5.5-1.1.7-1.8.7Z" fill="#185ABC"></path>
          <path d="m12 32-8 6v12h5v-7h6v7h5V38l-8-6Z" fill="#4285F4"></path>
        </symbol>
      </defs>
      <use href="#commutes-initial-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-add-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/>
        </symbol>
      </defs>
      <use href="#commutes-add-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-driving-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path d="M18.92 6.01C18.72 5.42 18.16 5 17.5 5h-11c-.66 0-1.21.42-1.42 1.01L3 12v8c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-1h12v1c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-8l-2.08-5.99zM6.85 7h10.29l1.08 3.11H5.77L6.85 7zM19 17H5v-5h14v5z"/>
          <circle cx="7.5" cy="14.5" r="1.5"/>
          <circle cx="16.5" cy="14.5" r="1.5"/>
        </symbol>
      </defs>
      <use href="#commutes-driving-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-transit-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path d="M12 2c-4 0-8 .5-8 4v9.5C4 17.43 5.57 19 7.5 19L6 20.5v.5h12v-.5L16.5 19c1.93 0 3.5-1.57 3.5-3.5V6c0-3.5-3.58-4-8-4zm5.66 3H6.43c.61-.52 2.06-1 5.57-1 3.71 0 5.12.46 5.66 1zM11 7v3H6V7h5zm2 0h5v3h-5V7zm3.5 10h-9c-.83 0-1.5-.67-1.5-1.5V12h12v3.5c0 .83-.67 1.5-1.5 1.5z"/>
          <circle cx="8.5" cy="14.5" r="1.5"/>
          <circle cx="15.5" cy="14.5" r="1.5"/>
        </symbol>
      </defs>
      <use href="#commutes-transit-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-bicycling-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path d="M15.5 5.5c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zM5 12c-2.8 0-5 2.2-5 5s2.2 5 5 5 5-2.2 5-5-2.2-5-5-5zm0 8.5c-1.9 0-3.5-1.6-3.5-3.5s1.6-3.5 3.5-3.5 3.5 1.6 3.5 3.5-1.6 3.5-3.5 3.5zm5.8-10l2.4-2.4.8.8c1.3 1.3 3 2.1 5.1 2.1V9c-1.5 0-2.7-.6-3.6-1.5l-1.9-1.9c-.5-.4-1-.6-1.6-.6s-1.1.2-1.4.6L7.8 8.4c-.4.4-.6.9-.6 1.4 0 .6.2 1.1.6 1.4L11 14v5h2v-6.2l-2.2-2.3zM19 12c-2.8 0-5 2.2-5 5s2.2 5 5 5 5-2.2 5-5-2.2-5-5-5zm0 8.5c-1.9 0-3.5-1.6-3.5-3.5s1.6-3.5 3.5-3.5 3.5 1.6 3.5 3.5-1.6 3.5-3.5 3.5z"/>
        </symbol>
      </defs>
      <use href="#commutes-bicycling-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-walking-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path d="M13.5 5.5c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zM9.8 8.9L7 23h2.1l1.8-8 2.1 2v6h2v-7.5l-2.1-2 .6-3C14.8 12 16.8 13 19 13v-2c-1.9 0-3.5-1-4.3-2.4l-1-1.6c-.56-.89-1.68-1.25-2.65-.84L6 8.3V13h2V9.6l1.8-.7"/>
        </symbol>
      </defs>
      <use href="#commutes-walking-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-chevron-left-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12l4.58-4.59z"/>
        </symbol>
      </defs>
      <use href="#commutes-chevron-left-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-chevron-right-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path xmlns="http://www.w3.org/2000/svg" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6-6-6z"/>
        </symbol>
      </defs>
      <use href="#commutes-chevron-right-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-arrow-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path d="M16.01 11H4v2h12.01v3L20 12l-3.99-4v3z"/>
        </symbol>
      </defs>
      <use href="#commutes-arrow-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-directions-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path d="M22.43 10.59l-9.01-9.01c-.75-.75-2.07-.76-2.83 0l-9 9c-.78.78-.78 2.04 0 2.82l9 9c.39.39.9.58 1.41.58.51 0 1.02-.19 1.41-.58l8.99-8.99c.79-.76.8-2.02.03-2.82zm-10.42 10.4l-9-9 9-9 9 9-9 9zM8 11v4h2v-3h4v2.5l3.5-3.5L14 7.5V10H9c-.55 0-1 .45-1 1z"/>
        </symbol>
      </defs>
      <use href="#commute-directions-icon"/>
    </svg>
    <svg class="hide">
      <defs>
        <symbol id="commutes-edit-icon">
          <path d="M0 0h24v24H0V0z" fill="none"/>
          <path d="M14.06 9.02l.92.92L5.92 19H5v-.92l9.06-9.06M17.66 3c-.25 0-.51.1-.7.29l-1.83 1.83 3.75 3.75 1.83-1.83c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.2-.2-.45-.29-.71-.29zm-3.6 3.19L3 17.25V21h3.75L17.81 9.94l-3.75-3.75z"/>
        </symbol>
      </defs>
      <use href="#commute-edit-icon"/>
    </svg>
    <!-- End commutes SVGs -->

    <main class="commutes">
      <div class="commutes-map" aria-label="Map">
        <div class="map-view"></div>
      </div>

      <div class="commutes-info">
        <div class="commutes-initial-state">
          <svg aria-label="Directions Icon" width="53" height="53" fill="none" xmlns="http://www.w3.org/2000/svg">
            <use href="#commutes-initial-icon"/>
          </svg>
          <div class="description">
            <h1 class="heading">Estimate commute time</h1>
            <p>See travel time and directions for places nearby</p>
          </div>
          <button class="add-button" autofocus>
            <svg aria-label="Add Icon" width="24px" height="24px" xmlns="http://www.w3.org/2000/svg">
              <use href="#commutes-add-icon"/>
            </svg>
            <span class="label">Add destination</span>
          </button>
        </div>

        <div class="commutes-destinations">
          <div class="destinations-container">
            <div class="destination-list"></div>
            <button class="add-button">
              <svg aria-label="Add Icon" width="24px" height="24px" xmlns="http://www.w3.org/2000/svg">
                <use href="#commutes-add-icon"/>
              </svg>
              <div class="label">Add destination</div>
            </button>
          </div>
          <button class="left-control hide" data-direction="-1" aria-label="Scroll left">
            <svg width="24px" height="24px" xmlns="http://www.w3.org/2000/svg" data-direction="-1">
              <use href="#commutes-chevron-left-icon" data-direction="-1"/>
            </svg>
          </button>
          <button class="right-control hide" data-direction="1" aria-label="Scroll right">
            <svg width="24px" height="24px" xmlns="http://www.w3.org/2000/svg" data-direction="1">
              <use href="#commutes-chevron-right-icon" data-direction="1"/>
            </svg>
          </button>
        </div>
      </div>
    </main>

    <div class="commutes-modal-container">
      <div class="commutes-modal" role="dialog" aria-modal="true" aria-labelledby="add-edit-heading">
        <div class="content">
          <h2 id="add-edit-heading" class="heading">Add destination</h2>
          <form id="destination-form">
            <input type="text" id="destination-address-input" name="destination-address" placeholder="Enter a place or address" autocomplete="off" required>
            <div class="error-message" role="alert"></div>
            <div class="travel-modes">
              <input type="radio" name="travel-mode" id="driving-mode" value="DRIVING" aria-label="Driving travel mode">
              <label for="driving-mode" class="left-label" title="Driving travel mode">
                <svg aria-label="Driving icon" mlns="http://www.w3.org/2000/svg">
                  <use href="#commutes-driving-icon"/>
                </svg>
              </label>
              <input type="radio" name="travel-mode" id="transit-mode" value="TRANSIT" aria-label="Public transit travel mode">
              <label for="transit-mode" title="Public transit travel mode">
                <svg aria-label="Public transit icon" xmlns="http://www.w3.org/2000/svg">
                  <use href="#commutes-transit-icon"/>
                </svg>
              </label>
              <input type="radio" name="travel-mode" id="bicycling-mode" value="BICYCLING" aria-label="Bicycling travel mode">
              <label for="bicycling-mode" title="Bicycling travel mode">
                <svg aria-label="Bicycling icon" xmlns="http://www.w3.org/2000/svg">
                  <use href="#commutes-bicycling-icon"/>
                </svg>
              </label>
              <input type="radio" name="travel-mode" id="walking-mode" value="WALKING" aria-label="Walking travel mode">
              <label for="walking-mode" class="right-label" title="Walking travel mode">
                <svg aria-label="Walking icon" xmlns="http://www.w3.org/2000/svg">
                  <use href="#commutes-walking-icon"/>
                </svg>
              </label>
            </div>
          </form>
          <div class="modal-action-bar">
            <button class="delete-destination-button hide" type="reset">
              Delete
            </button>
            <button class="cancel-button" type="reset">
              Cancel
            </button>
            <button class="add-destination-button" type="button">
              Add
            </button>
            <button class="edit-destination-button hide" type="button">
              Done
            </button>
          </div>
        </div>
      </div>
    </div>
    <script>
    'use strict';

    /**
     * Element selectors for commutes widget.
     */
    const commutesEl = {
      map: document.querySelector('.map-view'),
      initialStatePanel: document.querySelector('.commutes-initial-state'),
      destinationPanel: document.querySelector('.commutes-destinations'),
      modal: document.querySelector('.commutes-modal-container'),
    };

    /**
     * Element selectors for commutes destination panel.
     */
    const destinationPanelEl = {
      addButton: commutesEl.destinationPanel.querySelector('.add-button'),
      container: commutesEl.destinationPanel.querySelector('.destinations-container'),
      list: commutesEl.destinationPanel.querySelector('.destination-list'),
      scrollLeftButton: commutesEl.destinationPanel.querySelector('.left-control'),
      scrollRightButton: commutesEl.destinationPanel.querySelector('.right-control'),
      getActiveDestination: () => commutesEl.destinationPanel.querySelector('.destination.active'),
    };

    /**
     * Element selectors for commutes modal popup.
     */
    const destinationModalEl = {
      title: commutesEl.modal.querySelector('h2'),
      form: commutesEl.modal.querySelector('form'),
      destinationInput: commutesEl.modal.querySelector('input[name="destination-address"]'),
      errorMessage: commutesEl.modal.querySelector('.error-message'),
      addButton: commutesEl.modal.querySelector('.add-destination-button'),
      deleteButton: commutesEl.modal.querySelector('.delete-destination-button'),
      editButton: commutesEl.modal.querySelector('.edit-destination-button'),
      cancelButton: commutesEl.modal.querySelector('.cancel-button'),
      getTravelModeInput: () => commutesEl.modal.querySelector('input[name="travel-mode"]:checked'),
    };

    /**
     * Max number of destination allowed to be added to commutes panel.
     */
    const MAX_NUM_DESTINATIONS = 10;

    /**
     * Bounds to bias search within ~50km distance.
     */
    const BIAS_BOUND_DISTANCE = 0.5;

    /**
     * Hour in seconds.
     */
    const HOUR_IN_SECONDS = 3600;

    /**
     * Minutes in seconds.
     */
    const MIN_IN_SECONDS = 60;

    /**
     * Stroke colors for destination direction polylines for different states.
     */
    const STROKE_COLORS = {
      active: {
        innerStroke: '#4285F4',
        outerStroke: '#185ABC',
      },
      inactive: {
        innerStroke: '#BDC1C6',
        outerStroke: '#80868B',
      },
    };

    /**
     * Marker icon colors for different states.
     */
    const MARKER_ICON_COLORS = {
      active: {
        fill: '#EA4335',
        stroke: '#C5221F',
        label: '#FFF',
      },
      inactive: {
        fill: '#F1F3F4',
        stroke: '#9AA0A6',
        label: '#3C4043',
      },
    };

    /**
     * List of operations to perform on destinations.
     */
    const DestinationOperation = {
      ADD: 'ADD',
      EDIT: 'EDIT',
      DELETE: 'DELETE',
    };

    /**
     * List of available commutes travel mode.
     */
    const TravelMode = {
      DRIVING: 'DRIVING',
      TRANSIT: 'TRANSIT',
      BICYCLING: 'BICYCLING',
      WALKING: 'WALKING',
    };

    /**
     * Defines instance of Commutes widget to be instantiated when Map library
     * loads.
     */
    function Commutes(configuration) {
      let commutesMap;
      let activeDestinationIndex;
      let origin = configuration.mapOptions.center;
      let destinations = configuration.destination || [];
      let markerIndex = 0;
      let lastActiveEl;

      const markerIconConfig = {
        path:
            'M10 27c-.2 0-.2 0-.5-1-.3-.8-.7-2-1.6-3.5-1-1.5-2-2.7-3-3.8-2.2-2.8-3.9-5-3.9-8.8C1 4.9 5 1 10 1s9 4 9 8.9c0 3.9-1.8 6-4 8.8-1 1.2-1.9 2.4-2.8 3.8-1 1.5-1.4 2.7-1.6 3.5-.3 1-.4 1-.6 1Z',
        fillOpacity: 1,
        strokeWeight: 1,
        anchor: new google.maps.Point(15, 29),
        scale: 1.2,
        labelOrigin: new google.maps.Point(10, 9),
      };
      const originMarkerIcon = {
        ...markerIconConfig,
        fillColor: MARKER_ICON_COLORS.active.fill,
        strokeColor: MARKER_ICON_COLORS.active.stroke,
      };
      const destinationMarkerIcon = {
        ...markerIconConfig,
        fillColor: MARKER_ICON_COLORS.inactive.fill,
        strokeColor: MARKER_ICON_COLORS.inactive.stroke,
      };
      const bikeLayer = new google.maps.BicyclingLayer();
      const publicTransitLayer = new google.maps.TransitLayer();

      initMapView();
      initDestinations();
      initCommutesPanel();
      initCommutesModal();

      /**
       * Initializes map view on commutes widget.
       */
      function initMapView() {
        const mapOptionConfig = configuration.mapOptions;
        commutesMap = new google.maps.Map(commutesEl.map, mapOptionConfig);

        configuration.defaultTravelModeEnum =
            parseTravelModeEnum(configuration.defaultTravelMode);
        setTravelModeLayer(configuration.defaultTravelModeEnum);
        createMarker(origin);
      }

      /**
       * Initializes commutes widget with destinations info if provided with a list
       * of initial destinations and update view.
       */
      function initDestinations() {
        if (!configuration.initialDestinations) return;
        let callbackCounter = 0;
        const placesService = new google.maps.places.PlacesService(commutesMap);
        for (const destination of configuration.initialDestinations) {
          destination.travelModeEnum = parseTravelModeEnum(destination.travelMode);
          const label = getNextMarkerLabel();
          const request = {
            placeId: destination.placeId,
            fields: ['place_id', 'geometry', 'name'],
          };
          placesService.getDetails(
              request,
              function(place) {
                if (!place.geometry || !place.geometry.location) return;
                const travelModeEnum =
                    destination.travelModeEnum || configuration.defaultTravelModeEnum;
                const destinationConfig =
                    createDestinationConfig(place, travelModeEnum, label);
                getDirections(destinationConfig).then((response) => {
                  if (!response) return;
                  destinations.push(destinationConfig);
                  getCommutesInfo(response, destinationConfig);
                  callbackCounter++;
                  // Update commutes panel and click event objects after getting
                  // direction to all destinations.
                  if (callbackCounter === configuration.initialDestinations.length) {
                    destinations.sort(function(a, b) {
                      return a.label < b.label ? -1 : 1;
                    });
                    let bounds = new google.maps.LatLngBounds();
                    for (let i = 0; i < destinations.length; i++) {
                      assignMapObjectListeners(destinations[i], i);
                      updateCommutesPanel(destinations[i], i, DestinationOperation.ADD);
                      bounds.union(destinations[i].bounds);
                    }
                    const lastIndex = destinations.length - 1;
                    handleRouteClick(destinations[lastIndex], lastIndex);
                    commutesMap.fitBounds(bounds);
                  }
                });
              },
              () => {
                console.error('Failed to retrieve places info due to ' + e);
              });
        }
      }

      /**
       * Initializes the bottom panel for updating map view and displaying commutes
       * info.
       */
      function initCommutesPanel() {
        const addCommutesButtonEls = document.querySelectorAll('.add-button');
        addCommutesButtonEls.forEach(addButton => {
          addButton.addEventListener('click', () => {
            destinationModalEl.title.innerHTML = 'Add destination';
            hideElement(destinationModalEl.deleteButton);
            hideElement(destinationModalEl.editButton);
            showElement(destinationModalEl.addButton);
            showModal();
            const travelModeEnum = configuration.defaultTravelModeEnum || TravelMode.DRIVING;
            const travelModeId = travelModeEnum.toLowerCase() + '-mode';
            document.forms['destination-form'][travelModeId].checked = true;
          });
        });

        destinationPanelEl.scrollLeftButton.addEventListener(
            'click', handleScrollButtonClick);
        destinationPanelEl.scrollRightButton.addEventListener(
            'click', handleScrollButtonClick);
        destinationPanelEl.list.addEventListener('keydown', (e) => {
          if (e.key === 'Enter' &&
              e.target !== destinationPanelEl.getActiveDestination()) {
            e.target.click();
            e.preventDefault();
          }
        });
      }

      /**
       * Initializes commutes modal to gathering destination inputs. Configures the
       * event target listeners to update view and behaviors on the modal.
       */
      function initCommutesModal() {
        const boundConfig = {
          north: origin.lat + BIAS_BOUND_DISTANCE,
          south: origin.lat - BIAS_BOUND_DISTANCE,
          east: origin.lng + BIAS_BOUND_DISTANCE,
          west: origin.lng - BIAS_BOUND_DISTANCE,
        };

        const destinationFormReset = function() {
          destinationModalEl.destinationInput.classList.remove('error');
          destinationModalEl.errorMessage.innerHTML = '';
          destinationModalEl.form.reset();
          destinationToAdd = null;
        };

        const autocompleteOptions = {
          bounds: boundConfig,
          fields: ['place_id', 'geometry', 'name'],
        };
        const autocomplete = new google.maps.places.Autocomplete(
            destinationModalEl.destinationInput, autocompleteOptions);
        let destinationToAdd;
        autocomplete.addListener('place_changed', () => {
          const place = autocomplete.getPlace();
          if (!place.geometry || !place.geometry.location) {
            return;
          } else {
            destinationToAdd = place;
            destinationModalEl.getTravelModeInput().focus();
          }
          destinationModalEl.destinationInput.classList.remove('error');
          destinationModalEl.errorMessage.innerHTML = '';
        });

        destinationModalEl.addButton.addEventListener('click', () => {
          const isValidInput = validateDestinationInput(destinationToAdd);
          if (!isValidInput) return;
          const selectedTravelMode = destinationModalEl.getTravelModeInput().value;
          addDestinationToList(destinationToAdd, selectedTravelMode);
          destinationFormReset();
          hideModal();
        });

        destinationModalEl.editButton.addEventListener('click', () => {
          const destination = {...destinations[activeDestinationIndex]};
          const selectedTravelMode = destinationModalEl.getTravelModeInput().value;
          const isSameDestination =
              destination.name === destinationModalEl.destinationInput.value;
          const isSameTravelMode = destination.travelModeEnum === selectedTravelMode;
          if (isSameDestination && isSameTravelMode) {
            hideModal();
            return;
          }
          if (!isSameDestination) {
            const isValidInput = validateDestinationInput(destinationToAdd);
            if (!isValidInput) return;
            destination.name = destinationToAdd.name;
            destination.place_id = destinationToAdd.place_id;
            destination.url = generateMapsUrl(destinationToAdd, selectedTravelMode);
          }
          if (!isSameTravelMode) {
            destination.travelModeEnum = selectedTravelMode;
            destination.url = generateMapsUrl(destination, selectedTravelMode);
          }
          destinationFormReset();
          getDirections(destination)
              .then((response) => {
                if (!response) return;
                const currentIndex = activeDestinationIndex;
                // Remove current active direction before replacing it with updated
                // routes.
                removeDirectionsFromMapView(destination);
                destinations[activeDestinationIndex] = destination;
                getCommutesInfo(response, destination);
                assignMapObjectListeners(destination, activeDestinationIndex);
                updateCommutesPanel(
                    destination, activeDestinationIndex, DestinationOperation.EDIT);
                handleRouteClick(destination, activeDestinationIndex);
                const newEditButton = destinationPanelEl.list.children
                    .item(activeDestinationIndex)
                    .querySelector('.edit-button');
                newEditButton.focus();
              })
              .catch((e) => console.error('Editing directions failed due to ' + e));
          hideModal();
        });

        destinationModalEl.cancelButton.addEventListener('click', () => {
          destinationFormReset();
          hideModal();
        });

        destinationModalEl.deleteButton.addEventListener('click', () => {
          removeDirectionsFromMapView(destinations[activeDestinationIndex]);
          updateCommutesPanel(
              destinations[activeDestinationIndex], activeDestinationIndex,
              DestinationOperation.DELETE);
          activeDestinationIndex = undefined;
          destinationFormReset();
          let elToFocus;
          if (destinations.length) {
            const lastIndex = destinations.length - 1;
            handleRouteClick(destinations[lastIndex], lastIndex);
            elToFocus = destinationPanelEl.getActiveDestination();
          } else {
            elToFocus = commutesEl.initialStatePanel.querySelector('.add-button');
          }
          hideModal(elToFocus);
        });

        window.onmousedown = function(event) {
          if (event.target === commutesEl.modal) {
            destinationFormReset();
            hideModal();
          }
        };

        commutesEl.modal.addEventListener('keydown', (e) => {
          switch(e.key) {
            case 'Enter':
              if (e.target === destinationModalEl.cancelButton ||
                  e.target === destinationModalEl.deleteButton) {
                return;
              }
              if (destinationModalEl.addButton.style.display !== 'none') {
                destinationModalEl.addButton.click();
              } else if (destinationModalEl.editButton.style.display !== 'none') {
                destinationModalEl.editButton.click();
              }
              break;
            case "Esc":
            case "Escape":
              hideModal();
              break;
            default:
              return;
          }
          e.preventDefault();
        });

        // Trap focus in the modal so that tabbing on the last interactive element
        // focuses on the first, and shift-tabbing on the first interactive element
        // focuses on the last.

        const firstInteractiveElement = destinationModalEl.destinationInput;
        const lastInteractiveElements = [
          destinationModalEl.addButton,
          destinationModalEl.editButton,
        ];

        firstInteractiveElement.addEventListener(
            'keydown', handleFirstInteractiveElementTab);
        for (const el of lastInteractiveElements) {
          el.addEventListener('keydown', handleLastInteractiveElementTab);
        }

        function handleFirstInteractiveElementTab(event) {
          if (event.key === 'Tab' && event.shiftKey) {
            for (const el of lastInteractiveElements) {
              if (el.style.display !== 'none') {
                event.preventDefault();
                el.focus();
                return;
              }
            }
          }
        }

        function handleLastInteractiveElementTab(event) {
          if (event.key === 'Tab' && !event.shiftKey) {
            event.preventDefault();
            firstInteractiveElement.focus();
          }
        }
      }

      /**
       * Checks if destination input is valid and ensure no duplicate places or more
       * than max number places are added.
       */
      function validateDestinationInput(destinationToAdd) {
        let errorMessage;
        let isValidInput = false;
        if (!destinationToAdd) {
          errorMessage = 'No details available for destination input';
        } else if (destinations.length > MAX_NUM_DESTINATIONS) {
          errorMessage =
              'Cannot add more than ' + MAX_NUM_DESTINATIONS + ' destinations';
        } else if (
            destinations &&
            destinations.find(
                destination =>
                    destination.place_id === destinationToAdd.place_id)) {
          errorMessage = 'Destination is already added';
        } else {
          isValidInput = true;
        }
        if (!isValidInput) {
          destinationModalEl.errorMessage.innerHTML = errorMessage;
          destinationModalEl.destinationInput.classList.add('error');
        }
        return isValidInput;
      }

      /**
       * Removes polylines and markers of currently active directions.
       */
      function removeDirectionsFromMapView(destination) {
        destination.polylines.innerStroke.setMap(null);
        destination.polylines.outerStroke.setMap(null);
        destination.marker.setMap(null);
      }

      /**
       * Generates destination card template, attach event target listeners, and
       * adds template to destination list depending on the operations:
       * - add new destination card template to the end of the list on add.
       * - replace destination card template for current selected on edit.
       * - do nothing on default or delete.
       */
      function buildDestinationCardTemplate(
          destination, destinationIdx, destinationOperation) {
        let editButtonEl;
        switch (destinationOperation) {
          case DestinationOperation.ADD:
            destinationPanelEl.list.insertAdjacentHTML(
                'beforeend',
                '<div class="destination-container">' +
                    generateDestinationTemplate(destination) + '</div>');
            const destinationContainerEl = destinationPanelEl.list.lastElementChild;
            destinationContainerEl.addEventListener('click', () => {
              handleRouteClick(destination, destinationIdx);
            });
            editButtonEl = destinationContainerEl.querySelector('.edit-button');
            destinationPanelEl.container.scrollLeft =
                destinationPanelEl.container.scrollWidth;
            break;
          case DestinationOperation.EDIT:
            const activeDestinationContainerEl =
                destinationPanelEl.getActiveDestination().parentElement;
            activeDestinationContainerEl.innerHTML = generateDestinationTemplate(destination);
            activeDestinationContainerEl.addEventListener('click', () => {
              handleRouteClick(destination, destinationIdx);
            });
            editButtonEl = activeDestinationContainerEl.querySelector('.edit-button');
            break;
          case DestinationOperation.DELETE:
          default:
        }

        editButtonEl.addEventListener('click', () => {
          destinationModalEl.title.innerHTML = 'Edit destination';
          destinationModalEl.destinationInput.value = destination.name;
          showElement(destinationModalEl.deleteButton);
          showElement(destinationModalEl.editButton);
          hideElement(destinationModalEl.addButton);
          showModal();
          const travelModeId = destination.travelModeEnum.toLowerCase() + '-mode';
          document.forms['destination-form'][travelModeId].checked = true;
          // Update the autocomplete widget as if it was user input.
          destinationModalEl.destinationInput.dispatchEvent(new Event('input'));
        });
      }

      /**
       * Updates view of commutes panel depending on the operation:
       * - build/update destination template if add or edit.
       * - remove destination from destination list and rebuild template.
       */
      function updateCommutesPanel(
          destination, destinationIdx, destinationOperation) {
        switch (destinationOperation) {
          case DestinationOperation.ADD:
            hideElement(commutesEl.initialStatePanel);
            showElement(commutesEl.destinationPanel);
            // fall through
          case DestinationOperation.EDIT:
            buildDestinationCardTemplate(
                destination, destinationIdx, destinationOperation);
            break;
          case DestinationOperation.DELETE:
            destinations.splice(destinationIdx, 1);
            destinationPanelEl.list.innerHTML = '';
            for (let i = 0; i < destinations.length; i++) {
              buildDestinationCardTemplate(
                  destinations[i], i, DestinationOperation.ADD);
              assignMapObjectListeners(destinations[i], i);
            }
          default:
        }
        if (!destinations.length) {
          showElement(commutesEl.initialStatePanel, commutesEl.initialStatePanel);
          hideElement(commutesEl.destinationPanel);
          activeDestinationIndex = undefined;
          return;
        }
        destinationPanelEl.container.addEventListener('scroll', handlePanelScroll);
        destinationPanelEl.container.dispatchEvent(new Event('scroll'));
      }

      /**
       * Adds new destination to the list and get directions and commutes info.
       */
      function addDestinationToList(destinationToAdd, travelModeEnum) {
        const destinationConfig =
            createDestinationConfig(destinationToAdd, travelModeEnum);
        const newDestinationIndex = destinations.length;
        getDirections(destinationConfig)
            .then((response) => {
              if (!response) return;
              destinations.push(destinationConfig);
              getCommutesInfo(response, destinationConfig);
              assignMapObjectListeners(destinationConfig, newDestinationIndex);
              updateCommutesPanel(
                  destinationConfig, newDestinationIndex, DestinationOperation.ADD);
              handleRouteClick(destinationConfig, newDestinationIndex);
              destinationPanelEl.addButton.focus();
            })
            .catch((e) => console.error('Adding destination failed due to ' + e));
      }

      /**
       * Returns a new marker label on each call. Marker labels are the capital
       * letters of the alphabet in order.
       */
      function getNextMarkerLabel() {
        const markerLabels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        const label = markerLabels[markerIndex];
        markerIndex = (markerIndex + 1) % markerLabels.length;
        return label;
      }

      /**
       * Creates a destination config object from the given data. The label argument
       * is optional; a new label will be generated if not provided.
       */
      function createDestinationConfig(destinationToAdd, travelModeEnum, label) {
        return {
          name: destinationToAdd.name,
          place_id: destinationToAdd.place_id,
          label: label || getNextMarkerLabel(),
          travelModeEnum: travelModeEnum,
          url: generateMapsUrl(destinationToAdd, travelModeEnum),
        };
      }

      /**
       * Gets directions to destination from origin, add route to map view, and
       * update commutes panel with distance and directions info.
       */
      function getDirections(destination) {
        const request = {
          origin: origin,
          destination: {'placeId': destination.place_id},
          travelMode: destination.travelModeEnum,
          unitSystem: configuration.distanceMeasurementType === 'METRIC' ?
                  google.maps.UnitSystem.METRIC : google.maps.UnitSystem.IMPERIAL,
        };
        const directionsService = new google.maps.DirectionsService();
        return directionsService.route(request).then(response => {
          return response;
        });
      }

      /**
       * Adds route polyline, marker, and commutes info to map and destinations
       * list.
       */
      function getCommutesInfo(directionResponse, destination) {
        if (!directionResponse) return;
        const path = directionResponse.routes[0].overview_path;
        const bounds = directionResponse.routes[0].bounds;
        const directionLeg = directionResponse.routes[0].legs[0];
        const destinationLocation = directionLeg.end_location;
        const distance = directionLeg.distance.text;
        const duration = convertDurationValueAsString(directionLeg.duration.value);

        const innerStroke = new google.maps.Polyline({
          path: path,
          strokeColor: STROKE_COLORS.inactive.innerStroke,
          strokeOpacity: 1.0,
          strokeWeight: 3,
          zIndex: 10
        });

        const outerStroke = new google.maps.Polyline({
          path: path,
          strokeColor: STROKE_COLORS.inactive.outerStroke,
          strokeOpacity: 1.0,
          strokeWeight: 6,
          zIndex: 1
        });

        const marker = createMarker(destinationLocation, destination.label);

        innerStroke.setMap(commutesMap);
        outerStroke.setMap(commutesMap);

        destination.distance = distance;
        destination.duration = duration;
        destination.marker = marker;
        destination.polylines = {innerStroke, outerStroke};
        destination.bounds = bounds;
      }

      /**
       * Assigns event target listeners to map objects of corresponding destination
       * index.
       */
      function assignMapObjectListeners(destination, destinationIdx) {
        google.maps.event.clearListeners(destination.marker, 'click');

        google.maps.event.addListener(destination.marker, 'click', () => {
          handleRouteClick(destination, destinationIdx);
          destinationPanelEl.list.querySelectorAll('.destination')[destinationIdx].focus();
        });
        google.maps.event.addListener(destination.marker, 'mouseover', () => {
          changeMapObjectStrokeWeight(destination, true);
        });
        google.maps.event.addListener(destination.marker, 'mouseout', () => {
          changeMapObjectStrokeWeight(destination, false);
        });
        for (const strokeLine in destination.polylines) {
          google.maps.event.clearListeners(destination.polylines[strokeLine], 'click');
          google.maps.event.clearListeners(destination.polylines[strokeLine], 'mouseover');

          google.maps.event.addListener(destination.polylines[strokeLine], 'click', () => {
            handleRouteClick(destination, destinationIdx);
            destinationPanelEl.list.querySelectorAll('.destination')[destinationIdx].focus();
          });
          google.maps.event.addListener(destination.polylines[strokeLine], 'mouseover', () => {
            changeMapObjectStrokeWeight(destination, true);
          });
          google.maps.event.addListener(destination.polylines[strokeLine], 'mouseout', () => {
            changeMapObjectStrokeWeight(destination, false);
          });
        }
      }

      /**
       * Generates the Google Map url for direction from origin to destination with
       * corresponding travel mode.
       */
      function generateMapsUrl(destination, travelModeEnum) {
        let googleMapsUrl = 'https://www.google.com/maps/dir/?api=1';
        googleMapsUrl += `&origin=${origin.lat},${origin.lng}`;
        googleMapsUrl += '&destination=' + encodeURIComponent(destination.name) +
            '&destination_place_id=' + destination.place_id;
        googleMapsUrl += '&travelmode=' + travelModeEnum.toLowerCase();
        return googleMapsUrl;
      }

      /**
       * Handles changes to destination polyline and map icon stroke weight.
       */
      function changeMapObjectStrokeWeight(destination, mouseOver) {
        const destinationMarkerIcon = destination.marker.icon;
        if (mouseOver) {
          destination.polylines.outerStroke.setOptions({strokeWeight: 8});
          destinationMarkerIcon.strokeWeight = 2;
          destination.marker.setIcon(destinationMarkerIcon);
        }
        else {
          destination.polylines.outerStroke.setOptions({strokeWeight: 6});
          destinationMarkerIcon.strokeWeight = 1;
          destination.marker.setIcon(destinationMarkerIcon);
        }
      }

      /**
       * Handles route clicks. Originally active routes are set to inactive
       * states. Newly selected route's map polyline/marker objects and destination
       * template are assigned active class styling and coloring.
       */
      function handleRouteClick(destination, destinationIdx) {
        if (activeDestinationIndex !== undefined) {
          // Set currently active stroke to inactive
          destinations[activeDestinationIndex].polylines.innerStroke.setOptions(
              {strokeColor: STROKE_COLORS.inactive.innerStroke, zIndex: 2});
          destinations[activeDestinationIndex].polylines.outerStroke.setOptions(
              {strokeColor: STROKE_COLORS.inactive.outerStroke, zIndex: 1});

          // Set current active marker to grey
          destinations[activeDestinationIndex].marker.setIcon(
              destinationMarkerIcon);
          destinations[activeDestinationIndex].marker.label.color =
              MARKER_ICON_COLORS.inactive.label;

          // Remove styling of current active destination.
          const activeDestinationEl = destinationPanelEl.getActiveDestination();
          if (activeDestinationEl) {
            activeDestinationEl.classList.remove('active');
          }
        }

        activeDestinationIndex = destinationIdx;

        setTravelModeLayer(destination.travelModeEnum);
        // Add active class
        const newDestinationEl = destinationPanelEl.list.querySelectorAll(
            '.destination')[destinationIdx];
        newDestinationEl.classList.add('active');
        // Scroll into view
        newDestinationEl.scrollIntoView({behavior: 'smooth', block: 'center'});

        // Make line active
        destination.polylines.innerStroke.setOptions(
            {strokeColor: STROKE_COLORS.active.innerStroke, zIndex: 101});
        destination.polylines.outerStroke.setOptions(
            {strokeColor: STROKE_COLORS.active.outerStroke, zIndex: 99});

        destination.marker.setIcon(originMarkerIcon);
        destination.marker.label.color = '#ffffff';

        commutesMap.fitBounds(destination.bounds);
      }

      /**
       * Generates new marker based on location and label.
       */
      function createMarker(location, label) {
        const isOrigin = label === undefined ? true : false;
        const markerIconConfig = isOrigin ? originMarkerIcon : destinationMarkerIcon;
        const labelColor = isOrigin ? MARKER_ICON_COLORS.active.label :
                                    MARKER_ICON_COLORS.inactive.label;
        const labelText = isOrigin ? '●' : label;

        const mapOptions = {
          position: location,
          map: commutesMap,
          label: {
            text: labelText,
            fontFamily: 'Arial, sans-serif',
            color: labelColor,
            fontSize: '16px',
          },
          icon: markerIconConfig
        };

        if (isOrigin) {
          mapOptions.label.className += ' origin-pin-label';
          mapOptions.label.fontSize = '20px';
        }
        const marker = new google.maps.Marker(mapOptions);

        return marker;
      }

      /**
      * Returns a TravelMode enum parsed from the input string, or null if no match is found.
      */
      function parseTravelModeEnum(travelModeString) {
        switch (travelModeString) {
          case 'DRIVING':
            return TravelMode.DRIVING;
          case 'BICYCLING':
            return TravelMode.BICYCLING;
          case 'PUBLIC_TRANSIT':
            return TravelMode.TRANSIT;
          case 'WALKING':
            return TravelMode.WALKING;
          default:
            return null;
        }
      }

      /**
       * Sets map layer depending on the chosen travel mode.
       */
      function setTravelModeLayer(travelModeEnum) {
        switch (travelModeEnum) {
          case TravelMode.BICYCLING:
            publicTransitLayer.setMap(null);
            bikeLayer.setMap(commutesMap);
            break;
          case TravelMode.TRANSIT:
            bikeLayer.setMap(null);
            publicTransitLayer.setMap(commutesMap);
            break;
          default:
            publicTransitLayer.setMap(null);
            bikeLayer.setMap(null);
        }
      }

      /**
       * Convert time from durationValue in seconds into readable string text.
       */
      function convertDurationValueAsString(durationValue) {
        if (!durationValue) {
          return '';
        }
        if (durationValue < MIN_IN_SECONDS) {
          return '<1 min';
        }
        if (durationValue > HOUR_IN_SECONDS * 10) {
          return '10+ hours';
        }
        const hours = Math.floor(durationValue / HOUR_IN_SECONDS);
        const minutes = Math.floor(durationValue % HOUR_IN_SECONDS / 60);
        const hoursString = hours > 0 ? hours + ' h' : '';
        const minutesString = minutes > 0 ? minutes + ' min' : '';
        const spacer = hoursString && minutesString ? ' ' : '';
        return hoursString + spacer + minutesString;
      }

      /**
       * Shows the destination modal window, saving a reference to the currently
       * focused element so that focus can be restored by hideModal().
       */
      function showModal() {
        lastActiveEl = document.activeElement;
        showElement(commutesEl.modal, destinationModalEl.destinationInput);
      }

      /**
       * Hides the destination modal window, setting focus to focusEl if provided.
       * If no argument is passed, focus is restored to where it was when
       * showModal() was called.
       */
      function hideModal(focusEl) {
        hideElement(commutesEl.modal, focusEl || lastActiveEl);
      }
    }

    /**
     * Hides a DOM element and optionally focuses on focusEl.
     */
    function hideElement(el, focusEl) {
      el.style.display = 'none';
      if (focusEl) focusEl.focus();
    }

    /**
     * Shows a DOM element that has been hidden and optionally focuses on focusEl.
     */
    function showElement(el, focusEl) {
      el.style.display = 'flex';
      if (focusEl) focusEl.focus();
    }

    /**
     * Event handler function for scroll buttons.
     */
    function handleScrollButtonClick(e) {
      const multiplier = 1.25;
      const direction = e.target.dataset.direction;
      const cardWidth = destinationPanelEl.list.firstElementChild.offsetWidth;

      destinationPanelEl.container.scrollBy(
          {left: (direction * cardWidth * multiplier), behavior: 'smooth'});
    }

    /**
     * Event handler on scroll to add scroll buttons only if scroll width is larger
     * than width. Hide scroll buttons if scrolled to the start or end of the panel.
     */
    function handlePanelScroll() {
      const position = destinationPanelEl.container.scrollLeft;
      const scrollWidth = destinationPanelEl.container.scrollWidth;
      const width = destinationPanelEl.container.offsetWidth;

      if (scrollWidth > width) {
        if (position === 0) {
          destinationPanelEl.scrollLeftButton.classList.remove('visible');
        } else {
          destinationPanelEl.scrollLeftButton.classList.add('visible');
        }

        if (Math.ceil(position + width) >= scrollWidth) {
          destinationPanelEl.scrollRightButton.classList.remove('visible');
        } else {
          destinationPanelEl.scrollRightButton.classList.add('visible');
        }
      }
    }

    /**
     * Generates new destination template based on destination info properties.
     */
    function generateDestinationTemplate(destination) {
      const travelModeIconTemplate = '<use href="#commutes-' +
          destination.travelModeEnum.toLowerCase() + '-icon"/>';
      return `
        <div class="destination" tabindex="0" role="button">
          <div class="destination-content">
            <div class="metadata">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                  ${travelModeIconTemplate}
              </svg>
              ${destination.distance}
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <use href="#commutes-arrow-icon"/>
              </svg>
              <span class="location-marker">${destination.label}</span>
            </div>
            <div class="address">To
              <abbr title="${destination.name}">${destination.name}</abbr>
            </div>
            <div class="destination-eta">${destination.duration}</div>
          </div>
        </div>

        <div class="destination-controls">
          <a class="directions-button" href=${destination.url} target="_blank"
             aria-label="Link to directions in Google Maps">
            <svg aria-label="Directions icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
              <use href="#commutes-directions-icon"/>
            </svg>
          </a>
          <button class="edit-button" aria-label="Edit Destination">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
              <use href="#commutes-edit-icon"/>
            </svg>
            Edit
          </button>
        </div>`;
    }
    </script>
    <script>
      const CONFIGURATION = {
        "defaultTravelMode": "DRIVING",
        "distanceMeasurementType": "IMPERIAL",
        "mapOptions": {"center":{"lat":36.3504567,"lng":127.3848187},"fullscreenControl":true,"mapTypeControl":false,"streetViewControl":false,"zoom":14,"zoomControl":true,"maxZoom":20,"mapId":""},
        "mapsApiKey": "AIzaSyAq3dzxLVXjDuYYbkgoEC-xu7fejhiFd_c"
      };

      function initMap() {
        new Commutes(CONFIGURATION);
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAq3dzxLVXjDuYYbkgoEC-xu7fejhiFd_c&callback=initMap&libraries=places,geometry&solution_channel=GMP_QB_commutes_v2_c" async defer></script>
  </body>
</html>

<%@ include file="../common/head.jspf"%>

<%@ include file="../common/foot.jspf"%>