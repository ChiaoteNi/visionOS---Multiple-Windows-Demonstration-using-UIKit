//
//  Model3DPresentingView.swift
//  MutipleWindowPractice
//
//  Created by Chiaote Ni on 2024/2/25.
//

import SwiftUI
import RealityKit
import DemoModels

enum ModelType: String, CaseIterable {
    case aztecSculptureWhale1
    case aztecSculptureWhale2
    case alienWhale1

    var modelName: String {
        rawValue.replacingOccurrences(
            of: "([A-Z|0-9])",
            with: "_$1",
            options: .regularExpression
        ).lowercased()
    }

    var title: String {
        information["title"] ?? ""
    }

    var descriptions: String {
        information["description"] ?? ""
    }

    private var information: [String: String] {
        guard
            let path = Bundle.main.path(forResource: "ModelInformation", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: Any],
            let informations = dict[rawValue] as? [String: String]
        else {
            return [:]
        }
        return informations
    }
}

struct Model3DPresentingView: View {

    let modelType: ModelType
    @State var entity: Entity?

    var body: some View {
        RealityView{ content, attachments in
            entity = try? await Entity(named: modelType.modelName, in: demoModelsBundle)
            guard let entity = entity else { return }

            content.add(entity)
            entity.scale = SIMD3(0.2, 0.2, 0.2)

            if let attachment = attachments.entity(for: "title") {
                attachment.position = [0, -0.5, 0.25]
                attachment.orientation = simd_quatf(angle: .pi / 2, axis: [1, 0, 0])

                entity.addChild(attachment)
            }
            if let attachment = attachments.entity(for: "descriptions") {
                attachment.position = [0, -0.5, -0.5]
                attachment.orientation = simd_quatf(angle: .pi / 2, axis: [1, 0, 0])
                entity.addChild(attachment)
            }
        } attachments: {
            Attachment(id: "title") {
                Text(verbatim: modelType.title)
                    .font(.title)
                    .glassBackgroundEffect()
            }
            Attachment(id: "descriptions") {
                Text(verbatim: modelType.descriptions)
                    .font(.title3)
                    .glassBackgroundEffect()
            }
        }
        .background(Color.clear)
    }
}

#Preview {
    Model3DPresentingView(modelType: .aztecSculptureWhale2)
}
