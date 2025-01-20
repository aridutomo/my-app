'use client';

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
    <div className="flex justify-center items-center h-screen">
      Ari Dwi Utomo
    </div>
  );
}
