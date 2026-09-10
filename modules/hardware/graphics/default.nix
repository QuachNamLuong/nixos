{ ... }:
{
  imports = [
    # =========================================================
    # CHỈ CHỌN ĐÚNG CẤU HÌNH PHẦN CỨNG CỦA MÁY BẠN
    # Xóa dấu # ở đầu dòng để kích hoạt.
    # =========================================================

    # --- TRƯỜNG HỢP 1: Máy chỉ có card Intel (iGPU) ---
    # (VD: Laptop văn phòng, PC dùng CPU Intel không có card rời)
    ./intel.nix

    # --- TRƯỜNG HỢP 2: Máy chỉ có card AMD (iGPU hoặc dGPU) ---
    # (VD: Laptop dùng chip AMD Ryzen, PC dùng card Radeon RX)
    # ./amd.nix

    # --- TRƯỜNG HỢP 3: Laptop lai Intel + NVIDIA (Optimus/PRIME) ---
    # (VD: Laptop gaming dùng CPU Intel và card RTX)
    # ./intel.nix
    # ./nvidia.nix

    # --- TRƯỜNG HỢP 4: Laptop lai AMD + NVIDIA ---
    # (VD: Laptop gaming dùng CPU AMD Ryzen và card RTX)
    # ./amd.nix
    # ./nvidia.nix

    # --- TRƯỜNG HỢP 5: PC Desktop chỉ dùng card rời NVIDIA ---
    # (VD: PC build riêng chỉ cắm card RTX, không dùng iGPU)
    # ./nvidia.nix
  ];
}