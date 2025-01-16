'use client';

import Image from "next/image";
import Header from "./components/header";
import { useEffect } from "react";

export default function Home() {

  useEffect(() => {
    const btnTest = document.getElementById("test");
    if (btnTest) {
      btnTest.addEventListener("click", () => {
        alert("Test");
      });
    }
  }, []);

  return (
    <div>
      <Header />
      <div>
        <span id="test" className="cursor-pointer">Test</span>
      </div>
    </div>
  );
}
